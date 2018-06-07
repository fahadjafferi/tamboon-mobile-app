//
//  DataService.swift
//  tamboon-mobile-app
//
//  Created by FAHAD JAFFERI on 7/6/18.
//  Copyright © 2018 FAHAD JAFFERI. All rights reserved.
//

import Foundation

protocol DataServiceDelegate: class {
    func charityyLoaded()
    func donationsLoaded()
}

class DataService {
    static let instance = DataService()
    
    weak var delegate: DataServiceDelegate?
    var charities = [Charities]()
    var donations = [Donations]()
    
    // Get all Charities
    func getAllCharties() {
        let sessionConfig = URLSessionConfiguration.default
        
        // Create session, and optionally set a URLSessionDelegate
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        // Create the request
        // Get all the charities (Get /api/v1/foodtruck)
        guard let URL = URL(string: GET_ALL_CH_URL) else { return }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                //Sucess
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                if let data = data {
                    self.charities = Charities.parseCharitiesJSONData(data: data)
                    self.delegate?.charityyLoaded()
                }
           
            }
            else {
                //Failure
                print("URL Session Task Failed: \(error!.localizedDescription)")
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    // Get all reviews
}
