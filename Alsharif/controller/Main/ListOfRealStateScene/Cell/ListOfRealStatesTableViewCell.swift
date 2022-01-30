//
//  listOfRealStatesTableViewCell.swift
//  Alsharif
//
//  Created by no one on 27/01/2022.
//

import UIKit

class ListOfRealStatesTableViewCell: UITableViewCell,NibLoadableView,ReusableView {

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        mainView.setBorder(with: UIColor(color: .profileCellBorder)!, width: 1)
        mainView.roundCorners([.layerMaxXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMinYCorner,.layerMinXMaxYCorner], radius: 10)
        // Configure the view for the selected state
    }
    
}
