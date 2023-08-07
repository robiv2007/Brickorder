//
//  LoginView.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-07.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            TextField("email", text: $email)
                .autocorrectionDisabled()
            SecureField("password", text: $password)
            Button {
               //Login
            }
        label: {
            Text("Login")
        }

    }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
