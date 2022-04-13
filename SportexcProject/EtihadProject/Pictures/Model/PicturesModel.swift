//
//  PicturesModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 13/04/2022.
//

import Foundation

// MARK: - PicturesModel
struct PicturesModel: Codable {
    let msg: String
    let statusCode: Int
    let success: Bool
    let payload: [PicData]
}

// MARK: - Payload
struct PicData: Codable {
    let id: Int
    let image: String
    let title: String
}
