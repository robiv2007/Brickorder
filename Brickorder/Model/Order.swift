//
//  Order.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-11.
//

import Foundation

struct Order: Decodable {
    var id = UUID()
    let name: String
    let adress: String
    let description: String
}
