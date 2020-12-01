//
//  ForgotPasswordViewModel.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-12-01.
//

import Foundation
import Combine

class ForgotPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var emailInvalidMessage: String = ""
    @Published var emailInvalidMessageIsHidden: Bool = true
    @Published var isButtonDisabled: Bool = true

    var dismiss = PassthroughSubject<Void, Never>()

    var cancellables = Set<AnyCancellable>()

    init() {
        $email
            .map { email in
                return !(email.contains("@") && email.contains(".com") && !email.isEmpty)
            }
            .assign(to: &$isButtonDisabled)
    }

    func submitEmail() {
        dismiss.send(())
    }
}
