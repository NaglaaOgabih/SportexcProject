//
//  TabsModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 13/04/2022.
//


import Foundation

// MARK: - ChildDataModel
struct TabsModel: Codable {
    let msg: String?
    let statusCode: Int?
    let success: Bool?
    let payload: [Payload]?
}

// MARK: - Payload
struct Payload: Codable {
    let id: Int?
    let title: String?
}
