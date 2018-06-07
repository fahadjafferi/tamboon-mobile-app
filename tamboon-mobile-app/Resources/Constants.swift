//
//  Constants.swift
//  tamboon-mobile-app
//
//  Created by FAHAD JAFFERI on 7/6/18.
//  Copyright © 2018 FAHAD JAFFERI. All rights reserved.
//

import Foundation

// Callbacks
// Typealias for callbacks used in Data Service
typealias callback  = (_ success: Bool) -> ()

//Base URL
let BASE_API_URL = "http://localhost:3005/v1"

// Get all charities
let GET_ALL_CH_URL = "\(BASE_API_URL)/charities/all"
