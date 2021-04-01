//
//  DataLoader.swift
//  BID
//
//  Created by Apple on 11/01/21.
//  Copyright © 2021 Murugan. All rights reserved.
//

import Foundation
import UIKit

class DataLoader {
    
    var countryData = [CountryData]()
    
    init() {
        load()
    }
    
    func load() {
        if let file = Bundle.main.url(forResource: "CountryDetails", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: file)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([CountryData].self, from: data)
                
                self.countryData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}
