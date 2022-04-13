//
//  NewsModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 13/04/2022.
//

import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    let msg: String?
    let statusCode: Int?
    let success: Bool?
    let payload: [NewsData]?
}

// MARK: - Payload
struct NewsData: Codable {
    let id: Int?
    let image: String?
    let images: [Image]?
    let title, desc, payloadDescription, from: String?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case id, image, images, title, desc
        case payloadDescription = "description"
        case from, date
    }
}

// MARK: - Image
struct Image: Codable {
    let image: String?
}
