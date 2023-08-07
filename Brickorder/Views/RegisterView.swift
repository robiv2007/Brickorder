//
//  RegisterView.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-07.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            TextField("email", text: $email)
                .autocorrectionDisabled()
            SecureField("password", text: $password)
            Button {
                register()
            }
        label: {
            Text("Register")
        }

        }
    }

    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
