//
//  LoginView.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-11-23.
//

import SwiftUI
import Combine

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct LoginInfo {
    let username: String
    let password: String
}

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    @State var showForgotPassword: Bool = false

    var onSizeChanged: ((CGSize) -> Void)? = nil

    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
                .autocapitalization(.none)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1))

            if !viewModel.passwordErrorMessageIsHidden {
                Text(viewModel.passwordErrorMessage)
                    .foregroundColor(.red)
                    .frame(alignment: .leading)
            }

            SecureField("Password", text: $viewModel.password)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1))

            if !viewModel.loginFailedMessageIsHidden {
                Text(viewModel.loginFailedMessage)
                    .foregroundColor(.red)
                    .frame(alignment: .leading)
            }

            Button("Login") {
                viewModel.performLogin()
            }
            .accentColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(viewModel.isButtonDisabled ? Color.gray : Color.blue))
            .disabled(viewModel.isButtonDisabled)

            Button("Forgot Password") {
                showForgotPassword.toggle()
            }.sheet(isPresented: $showForgotPassword, content: {
                ForgotPasswordView(viewModel: ForgotPasswordViewModel())
            }).padding()
        }.padding()
        .background(GeometryReader { geometryProxy in
            Color.clear
                .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
        })
        .onPreferenceChange(SizePreferenceKey.self, perform: { value in
            if let onSizeChanged = onSizeChanged {
                onSizeChanged(value)
            }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
