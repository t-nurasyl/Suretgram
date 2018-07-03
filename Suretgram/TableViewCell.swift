//
//  TableViewCell.swift
//  Suretgram
//
//  Created by Нурасыл on 03.07.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell { // nurasyl belka


    @IBOutlet weak var instaImage: UIImageView!
    @IBOutlet weak var instaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // karkar rulit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
