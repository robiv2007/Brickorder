//
//  ListView.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-09.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var dataManager: DataManager
    @State private var showSheet: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List(dataManager.orders, id: \.id) { order in
                    Text(order.name)

                }
                .onAppear(perform: dataManager.fetchOrders)

                Button {
                    showSheet.toggle()
                } label: {
                    Text("New order")
                }
            }
            .sheet(isPresented: $showSheet) {
                NewOrderView()
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
