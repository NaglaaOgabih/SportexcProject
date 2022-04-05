//
//  NewOrderModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 04/04/2022.
//

import Foundation

// MARK: - NewOrderModel
struct NewOrderModel: Codable {
    let key, msg: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let productName: String?
    let totalCart: Int?

    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case totalCart = "total_cart"
    }
}
