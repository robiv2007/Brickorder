//
//  ListView.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-09.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var dataManager: DataManager
    var body: some View {
        NavigationView {
            List(dataManager.orders, id: \.id ) { order in
                Text(order.name)

            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
