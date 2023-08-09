//
//  LoginView.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-07.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {

    @StateObject var vm = LoginViewModel()
   
    var body: some View {
        VStack {
            TextField("email", text: $vm.email)
                .autocorrectionDisabled()
            SecureField("password", text: $vm.password)
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
