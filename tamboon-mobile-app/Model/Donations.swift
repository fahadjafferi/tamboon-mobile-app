//
//  Donations.swift
//  tamboon-mobile-app
//
//  Created by FAHAD JAFFERI on 7/6/18.
//  Copyright © 2018 FAHAD JAFFERI. All rights reserved.
//

import Foundation

struct Donations {
    
    var name: String = ""
    var token: String = ""
    var amount: Int?
    
    static func parseDonationJSONData(data: Data) -> [Donations] {
        var donations = [Donations]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            //Parse JSON data
            if let contributions = jsonResult as? [Dictionary<String, AnyObject>] {
                for contribution in contributions {
                    
                    var newContribution = Donations()
                    newContribution.name = contribution["name"] as! String
                    newContribution.token = contribution["token"] as! String
                    newContribution.amount = contribution["amount"] as? Int
                    
                    donations.append(newContribution)
                }
            }
            
        } catch let err {
            print(err)
        }
        return donations 
    }
}
