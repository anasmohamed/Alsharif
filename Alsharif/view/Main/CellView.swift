//
//  CellView.swift
//  Alsharif
//
//  Created by mac on 10/02/2022.
//

import UIKit

class CellView: UITableViewCell {
    @IBOutlet weak var titleLable:UILabel!
    @IBOutlet weak var addresslab:UILabel!
    @IBOutlet weak var pricelab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
