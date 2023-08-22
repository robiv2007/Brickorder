//
//  DataManager.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-11.
//

import Foundation
import Firebase


class DataManager: ObservableObject {

    static let shared = DataManager()

    @Published var orders: [Order] = []

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
                    let id = data["id"] as? UUID
                    let name = data["name"] as? String ?? ""
                    let adress = data["adress"] as? String ?? ""
                    let description = data["description"] as? String ?? ""

                    let order = Order(id: id ?? UUID(), name: name, adress: adress, description: description)
                    self.orders.append(order)
                }
            }

        }
    }

    func addOrder(name: String, description: String, address: String) {
        let db = Firestore.firestore()
        let ordersCollection = db.collection("Orders")

        var ref: DocumentReference? = nil
        ref = ordersCollection.addDocument(data: [
            "name": name,
            "description": description,
            "address": address
        ]) { error in
            if let error = error {
                print("Error adding order: \(error.localizedDescription)")
            } else {
                if let documentID = ref?.documentID {
                    print("Order added with ID: \(documentID)")
                }
            }
        }
    }


    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
        }
    }

    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
        }
    }
}
