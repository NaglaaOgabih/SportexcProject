//
//  VideoPlayModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 16/04/2022.
//

import Foundation

// MARK: - VideoPlayModel
struct VideoPlayModel: Codable {
    let msg: String
    let statusCode: Int
    let success: Bool
    let payload: VideoDetails
}

// MARK: - Payload
struct VideoDetails: Codable {
    let id: Int
    let cover: String
    let video: String
    let title: String
}
