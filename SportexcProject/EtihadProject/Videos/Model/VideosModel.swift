//
//  VideosModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 14/04/2022.
//

import Foundation

// MARK: - VideosModel
struct VideosModel: Codable {
    let msg: String?
    let statusCode: Int?
    let success: Bool?
    let payload: [Video]?
}

// MARK: - Payload
struct Video: Codable {
    let id: Int?
    let cover: String?
    let video: String?
    let title: String?
}
