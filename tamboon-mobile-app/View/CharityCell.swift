//
//  CharityCell.swift
//  tamboon-mobile-app
//
//  Created by FAHAD JAFFERI on 8/6/18.
//  Copyright © 2018 FAHAD JAFFERI. All rights reserved.
//

import UIKit

class CharityCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logo_url: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(charity: Charities) {
        nameLabel.text = charity.name
        logo_url.text = charity.logo_url
    }

}
