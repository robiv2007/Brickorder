//
//  NewOrderView.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-11.
//

import SwiftUI

struct NewOrderView: View {

    @State private var name: String = ""
    @State private var adress: String = ""
    @State private var description: String = ""

    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        VStack {
            TextField("Name", text: $name)
            TextField("adress", text: $adress)
            TextField("description", text: $description)
            Button {
                dataManager.addOrder(name: name, description: description, address: adress)
            } label: {
                Text("Save")
            }
        }
    }
}

struct NewOrderView_Previews: PreviewProvider {
    static var previews: some View {
        NewOrderView()
    }
}
