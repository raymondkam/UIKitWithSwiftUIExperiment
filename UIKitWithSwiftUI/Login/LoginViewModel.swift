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

    @Published var isButtonDisabled: Bool = true

    var cancellables = Set<AnyCancellable>()

    init() {
        Publishers
            .CombineLatest($username, $password)
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .map { (username, password) -> Bool in
                return !username.isEmpty && !password.isEmpty
            }
            .sink { [weak self] isFormValid in
                self?.isButtonDisabled = !isFormValid
            }
            .store(in: &cancellables)
    }

    func performLogin() {
        let info = LoginInfo(username: username, password: password)
        print("login info: \(info)")
        // send off request
    }
}
