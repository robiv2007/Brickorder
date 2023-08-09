//
//  RegisterViewModel.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-09.
//

import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""

    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
}
