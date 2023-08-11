//
//  DataManager.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-11.
//

import Foundation
import Firebase


class DataManager: ObservableObject {

    @Published var orders: [Order] = []

    init() {
        fetchOrders()
    }

    func fetchOrders() {
        orders.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Orders")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }

            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let adress = data["adress"] as? String ?? ""
                    let description = data["description"] as? String ?? ""

                    let order = Order(id: id, name: name, adress: adress, description: description)
                    self.orders.append(order)
                }
            }

        }
    }

}
