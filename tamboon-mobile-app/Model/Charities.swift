//
//  Charities.swift
//  tamboon-mobile-app
//
//  Created by FAHAD JAFFERI on 7/6/18.
//  Copyright © 2018 FAHAD JAFFERI. All rights reserved.
//

import Foundation

class Charities: NSObject {
    var id: Int?
    var name: String = ""
    var logo_url: String = ""
    
    static func parseCharitiesJSONData(data: Data) -> [Charities] {
        var charities = [Charities]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            //Parse JSON Data
            if let charitys = jsonResult as? [Dictionary<String, AnyObject>] {
                for charity in charitys {
                    
                    let newCharity = Charities()
                    newCharity.id = charity["_id"] as? Int 
                    newCharity.name = charity["name"] as! String
                    newCharity.logo_url = charity["logo_url"] as! String
                    
                    charities.append(newCharity)
                }
            }
        } catch let err {
            print(err)
        }
        return charities
    }
}


