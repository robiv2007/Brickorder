//
//  RegisterView.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-07.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var vm = RegisterViewModel()
    @EnvironmentObject var dataManager: DataManager
    var body: some View {
        VStack {
            TextField("email", text: $vm.email)
                .autocorrectionDisabled()
            SecureField("password", text: $vm.password)
            Button {
                dataManager.register(email: vm.email, password: vm.password)
            }
        label: {
            Text("Register")
        }
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
