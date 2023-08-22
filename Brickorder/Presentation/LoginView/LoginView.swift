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
    @EnvironmentObject var dataManager: DataManager
    var body: some View {
        if vm.isUserLoggedIn {
            ListView()
        } else {
            mainView
        }
    }

    var mainView: some View {
        VStack {
            TextField("email", text: $vm.email)
                .autocorrectionDisabled()
            SecureField("password", text: $vm.password)
            Button {
                dataManager.login(email: vm.email, password: vm.password)
            }
        label: {
            Text("Login")
        }

        }
        .onAppear(perform: vm.checkUser)
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(DataManager())
    }
}
