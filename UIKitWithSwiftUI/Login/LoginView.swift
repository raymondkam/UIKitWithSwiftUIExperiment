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
    @ObservedObject var viewModel: LoginViewModel

    var onSizeChanged: ((CGSize) -> Void)? = nil

    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1))
            SecureField("Password", text: $viewModel.password)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1))
            Button("Login") {
                viewModel.performLogin()
            }
            .padding()
            .disabled(viewModel.isButtonDisabled)
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