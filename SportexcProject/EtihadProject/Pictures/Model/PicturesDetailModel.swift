//
//  PicturesDetailModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 13/04/2022.
//

import Foundation

// MARK: - PicturesDetailModel
struct PicturesDetailModel: Codable {
    let msg: String
    let statusCode: Int
    let success: Bool
    let payload: [PicturesDetail]
}

// MARK: - Payload
struct PicturesDetail: Codable {
    let id: Int
    let image: String
}
