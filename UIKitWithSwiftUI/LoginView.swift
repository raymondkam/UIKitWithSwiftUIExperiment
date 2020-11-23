//
//  LoginView.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-11-23.
//

import SwiftUI

struct LoginInfo {
    let username: String
    let password: String
}

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""

    var loginAction: (LoginInfo) -> Void

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1))
            SecureField("Password", text: $password)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1))
            Button("Login") {
                loginAction(LoginInfo(username: username, password: password))
            }.padding()
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView { (loginInfo) in

        }
    }
}
