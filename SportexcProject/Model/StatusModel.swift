//
//  StatusModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 04/04/2022.
//

import Foundation

struct StatusModel: Codable {
    let status: [Status]?
}
// MARK: - Status
struct Status: Codable {
    let statusID, statusName, statusColor: String?
    enum CodingKeys: String, CodingKey {
        case statusID = "status_id"
        case statusName = "status_name"
        case statusColor = "status_color"
    }
}
