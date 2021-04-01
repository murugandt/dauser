//
//  ProfileModel.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import Foundation

struct ProfileModel : Decodable
{
    let error : errorModel?
    let data: ProfileDetails?
    
    static func convertData(data: Data) -> ProfileModel? {
        let model = try! JSONDecoder().decode(ProfileModel.self, from: data)
        return model
    }
}

struct ProfileDetails: Codable{
    let id: Int?
    let username: String?
}

struct CommonModel : Decodable
{
    let error : errorModel?
    
    static func convertData(data: Data) -> CommonModel? {
        let model = try! JSONDecoder().decode(CommonModel.self, from: data)
        return model
    }
}

