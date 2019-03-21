//
//  RepresentativeTableViewCell.swift
//  Representative
//
//  Created by Hannah Hoff on 3/21/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews() {
        nameLabel.text = representative?.name
        partyLabel.text = representative?.party
        districtLabel.text = representative?.district
        phoneLabel.text = representative?.phone
        officeLabel.text = representative?.office
        linkLabel.text = representative?.link
    }

}
