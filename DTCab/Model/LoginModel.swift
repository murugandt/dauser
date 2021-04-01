//
//  LoginModel.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import Foundation
import Alamofire

struct UserDetails
{
    public init() {}
    public static var userDetailModel: LoginModel?
    {
        let data = UserDefaults.standard.data(forKey: "UserDetails")
        guard data != nil else { return nil}
        return try? JSONDecoder().decode(LoginModel.self, from: data!)
    }
}

struct LoginModel : Decodable
{
    let error : errorModel?
    
    static func convertData(data: Data) -> LoginModel? {
        UserDefaults.standard.set(data, forKey: "UserDetails")
        let model = try! JSONDecoder().decode(LoginModel.self, from: data)
        return model
    }
}

struct errorModel: Codable{
    let code : Int!
    let message : String?
}


struct Connectivity{
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool{
        return self.sharedInstance.isReachable
    }
}
