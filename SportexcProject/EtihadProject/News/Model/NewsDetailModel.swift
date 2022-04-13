//
//  NewsDetailModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 13/04/2022.
//

import Foundation

// MARK: - NewsDetailModel
struct NewsDetailModel: Codable {
    let msg: String?
    let statusCode: Int?
    let success: Bool?
    let payload: NewsDetails?
}

// MARK: - Payload
struct NewsDetails: Codable {
    let id: Int?
    let image: String?
    let images: [DetailImage]?
    let title, desc, from, date: String?
}

// MARK: - Image
struct DetailImage: Codable {
    let image: String?
}
