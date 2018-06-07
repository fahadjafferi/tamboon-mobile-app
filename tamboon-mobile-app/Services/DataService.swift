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
        // Get all the charities (Get /v1/charities/all)
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
    
    // Get all donations
    func getAllDonations() {
        let sessionConfig = URLSessionConfiguration.default

    // Create session, and optionally set a URLSessionDelegate
    let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

    // Create the request
    // Get all the charities (Get /v1/donations/all)
    guard let URL = URL(string: GET_ALL_DONATIONS_URL) else { return }
    var request = URLRequest(url: URL)
    request.httpMethod = "GET"

    let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
        if (error == nil) {
            //Sucess
            let statusCode = (response as! HTTPURLResponse).statusCode
            print("URL Session Task Succeeded: HTTP \(statusCode)")
            if let data = data {
                self.donations = Donations.parseDonationJSONData(data: data)
                self.delegate?.donationsLoaded()
            }
        
        } else {
                //Failure
                print("URL Session Task Failed: \(error!.localizedDescription)")
            }
    })
    task.resume()
    session.finishTasksAndInvalidate()

}
    
    // Post add new donation
    func addNewDonation(_ name: String, token: String, amount: Int, completion: @escaping callback) {
        
        // Construc our JSON
        let json: [String: Any] = [
            "name": name,
            "token": token,
            "amount": amount
        ]
        
        do  {
           // Serialize JSON
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            
            let sessionConfig = URLSessionConfiguration.default
            
            let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
            
            guard let URL = URL(string: POST_ADD_NEW_DONATION) else {return}
            var request = URLRequest(url: URL)
            request.httpMethod = "POST"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpBody = jsonData
            
            let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                if (error == nil) {
                    //Success
                    //Check for status code 200.
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("URL Session Task Succeeeded: HTTP \(statusCode)")
                    if statusCode != 200 {
                        completion(false)
                        return
                    } else {
                        self.getAllDonations()
                        completion(true)
                    }
                } else {
                    // Failure
                    print("URL Session Task Failed: \(String(describing: error?.localizedDescription))")
                    completion(false)
                }
            })
            task.resume()
            session.finishTasksAndInvalidate()
            
        } catch let err {
            completion(false)
            print(err)
        }
    }
    
}
        
        
        
        
        
        



