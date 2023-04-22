//
//  TableViewCell.swift
//  PictureApp
//
//  Created by Son Nguyen on 4/22/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
