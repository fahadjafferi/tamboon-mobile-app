//
//  MainVC.swift
//  tamboon-mobile-app
//
//  Created by FAHAD JAFFERI on 7/6/18.
//  Copyright © 2018 FAHAD JAFFERI. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.instance.delegate = self

        DataService.instance.getAllCharties()
    }

}

extension MainVC: DataServiceDelegate {
    func charityyLoaded() {
        print(DataService.instance.charities)
    }
    
    func donationsLoaded() {
        
    }
}
