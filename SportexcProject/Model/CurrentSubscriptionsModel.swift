//
//  CurrentSubscriptionsModel.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 05/04/2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let lastSubscriptionsModel = try? newJSONDecoder().decode(LastSubscriptionsModel.self, from: jsonData)
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currentSubscriptionsModel = try? newJSONDecoder().decode(CurrentSubscriptionsModel.self, from: jsonData)

import Foundation

// MARK: - CurrentSubscriptionsModel
struct CurrentSubscriptionsModel: Codable {
    let subscription: [Subscription]?
    let success: Int?
}

// MARK: - Subscription
struct Subscription: Codable {
    let subscriptionID, childID, sportID, sportName: String?
    let branchID, branchName, ageGroupID, ageGroup: String?
    let periodID, period, trainingTimingID: String?
    let trainingTiming: [String]?
    let suitID: String?
    let suit, suitQuantity: [String]?
    let statusID, statusName, statusColor, price: String?
    let deliveryStatus, addressID: String?
    let addressDetails: AddressDetails?
    let startDate, date, classNumber, classRemain: String?
    let child: Child?

    enum CodingKeys: String, CodingKey {
        case subscriptionID = "subscription_id"
        case childID = "child_id"
        case sportID = "sport_id"
        case sportName = "sport_name"
        case branchID = "branch_id"
        case branchName = "branch_name"
        case ageGroupID = "age_group_id"
        case ageGroup = "age_group"
        case periodID = "period_id"
        case period
        case trainingTimingID = "training_timing_id"
        case trainingTiming = "training_timing"
        case suitID = "suit_id"
        case suit
        case suitQuantity = "suit_quantity"
        case statusID = "status_id"
        case statusName = "status_name"
        case statusColor = "status_color"
        case price
        case deliveryStatus = "delivery_status"
        case addressID = "address_id"
        case addressDetails = "address_details"
        case startDate = "start_date"
        case date
        case classNumber = "class_number"
        case classRemain = "class_remain"
        case child
    }
}

// MARK: - AddressDetails
struct AddressDetails: Codable {
    let lat, lang, clientPhone, regionID: String
    let regionName, block, road, building: String
    let floorNumber, flatNumber, note: String

    enum CodingKeys: String, CodingKey {
        case lat, lang
        case clientPhone = "client_phone"
        case regionID = "region_id"
        case regionName = "region_name"
        case block, road, building
        case floorNumber = "floor_number"
        case flatNumber = "flat_number"
        case note
    }
}

// MARK: - Child
struct Child: Codable {
    let childID, childName, childCpr, childGender: String
    let childBirthdate, childAge, childImage, childIDImage: String
    let childDiseases, childDiseaseDetails, childVaccination, childVaccinationNo: String
    let date: String

    enum CodingKeys: String, CodingKey {
        case childID = "child_id"
        case childName = "child_name"
        case childCpr = "child_cpr"
        case childGender = "child_gender"
        case childBirthdate = "child_birthdate"
        case childAge = "child_age"
        case childImage = "child_image"
        case childIDImage = "child_id_image"
        case childDiseases = "child_diseases"
        case childDiseaseDetails = "child_disease_details"
        case childVaccination = "child_vaccination"
        case childVaccinationNo = "child_vaccination_no"
        case date
    }
}
