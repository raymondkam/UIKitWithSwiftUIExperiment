//
//  LoginViewModel.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-11-23.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var passwordErrorMessage: String = ""
    @Published var passwordErrorMessageIsHidden: Bool = true
    @Published var loginFailedMessage: String = ""
    @Published var loginFailedMessageIsHidden: Bool = true
    @Published var isButtonDisabled: Bool = true

    var loginSuccess: PassthroughSubject<Void, Never> = PassthroughSubject()

    var cancellables = Set<AnyCancellable>()

    init() {
        Publishers
            .CombineLatest($username, $password)
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .map { (username, password) -> Bool in
                return !username.isEmpty && Self.validate(password)
            }
            .map { !$0 }
            .assign(to: &$isButtonDisabled)
        $password
            .dropFirst()
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] password in
                if Self.validate(password) {
                    self?.passwordErrorMessage = ""
                    self?.passwordErrorMessageIsHidden = true
                } else {
                    self?.passwordErrorMessage = "Password must not be empty"
                    self?.passwordErrorMessageIsHidden = false
                }
            }
            .store(in: &cancellables)
    }

    func performLogin() {
        let info = LoginInfo(username: username, password: password)
        print("login info: \(info)")
        // send off request
        if info.username == "raymond" && info.password == "password1234" {
            loginFailedMessage = ""
            loginFailedMessageIsHidden = true
            loginSuccess.send(())
        } else {
            loginFailedMessage = "Email or password incorrect"
            loginFailedMessageIsHidden = false
        }
    }

    private static func validate(_ password: String) -> Bool {
        return !password.isEmpty
    }
}
