//
//  ForgotPasswordView.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-12-01.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject var viewModel: ForgotPasswordViewModel

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 12) {
            if presentationMode.wrappedValue.isPresented {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 16, height: 16)
                    })
                    .padding(4)
                    Spacer()
                }
            }
            Text("Forgot Password")
                .font(.title)
                .padding()
            Text("Enter your email. We'll provide instructions on how to get it reset.")
            VStack(alignment: .leading) {
                if !viewModel.emailInvalidMessageIsHidden {
                    Text("Email not found")
                        .foregroundColor(.red)
                }
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1))
                GeometryReader { proxy in
                    Button("Submit") {
                        viewModel.submitEmail()
                    }
                    .padding()
                    .frame(width: proxy.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .accentColor(.white)
                    .background(RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(viewModel.isButtonDisabled ? Color.gray : Color.blue))
                    .disabled(viewModel.isButtonDisabled)
                }
            }.padding()
        }
        .padding()
        .onReceive(viewModel.dismiss, perform: { _ in
            presentationMode.wrappedValue.dismiss()
        })
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(viewModel: ForgotPasswordViewModel())
    }
}
