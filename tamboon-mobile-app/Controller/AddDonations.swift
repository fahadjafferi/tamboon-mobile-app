//
//  AddDonations.swift
//  tamboon-mobile-app
//
//  Created by FAHAD JAFFERI on 8/6/18.
//  Copyright © 2018 FAHAD JAFFERI. All rights reserved.
//

import UIKit

class AddDonations: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var tokenField: UITextField!
    @IBOutlet weak var amountField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func addButtonTapped(sender: UIButton) {
        
    }
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        dismissViewController()
    }

    @IBAction func backButtonTapped(sender: UIButton) {
        dismissViewController()
        
    }
    
    func dismissViewController() {
        OperationQueue.main.addOperation {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }

}
