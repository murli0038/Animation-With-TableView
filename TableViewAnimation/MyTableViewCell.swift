//
//  MyTableViewCell.swift
//  TableViewAnimation
//
//  Created by Nikunj Prajapati on 09/01/20.
//  Copyright © 2020 Nikunj Prajapati. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
