//
//  LoginViewModel.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-09.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isUserLoggedIn: Bool = false

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
        }
    }

    func checkUser() {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.isUserLoggedIn.toggle()
            }
        }

    }
    
}
