//
//  GeneralUtility.swift
//  SwiftUITableView
//
//  Created by Anurag Bhakuni on 05/08/21.
//

import Foundation
struct BundleDecoder
{
    static func decodeLandmarkBundleJson() -> [City] {
        let landmarkJson = Bundle.main.path(forResource: "landmarks", ofType: "json")
        let landmark = try! Data(contentsOf: URL(fileURLWithPath: landmarkJson!), options: .alwaysMapped)
        return try! JSONDecoder().decode([City].self, from: landmark)
    }
}



struct City: Codable {
    let cityID: Int
    let name: String
    let landmarks: [Landmark]

    enum CodingKeys: String, CodingKey {
        case cityID = "cityId"
        case name, landmarks
    }
}

// MARK: - Landmark
struct Landmark: Codable {
    let landmarkID: Int
    let name, photo, landmarkDescription: String

    enum CodingKeys: String, CodingKey {
        case landmarkID = "landmarkId"
        case name, photo
        case landmarkDescription = "description"
    }
}
