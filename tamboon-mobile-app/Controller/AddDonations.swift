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
        guard let name = nameField.text, nameField.text != ""
            else {
                showAlert(with: "Error", message: "Please enter your first and last name")
            return
        }
        guard let token = tokenField.text, tokenField.text != ""
            else {
                showAlert(with: "Error", message: "Please enter a token")
           return
        }
        guard let amount = Int(amountField.text!), amountField.text != ""
            else {
                showAlert(with: "Error", message: "Please enter a donation amount")
            return
        }
        
        let alertController = UIAlertController(title: "Tamboon", message:
            "Donation Successfull", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    
      DataService.instance.addNewDonation(name, token: token, amount: amount, completion: {
            Success in
            
            if Success {
                print("We saved successfully")
                self.dismissViewController()
                } else {
                self.showAlert(with: "Error", message: "An error occured while processing the donation amount")
                print("We didn't process donation sucessfully")
            }
        })
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
    
    func showAlert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: . default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
        
}

