//
//  ProfileTVC.swift
//  Namla
//
//  Created by Ali Shaheen on 26/04/2021.
//

import UIKit

class SettingTVC: UITableViewCell,ReusableView,NibLoadableView {
    @IBOutlet weak var mainView:UIView!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var iconImageView:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.setBorder(with: UIColor(color: .profileCellBorder)!, width: 1)
        mainView.roundCorners([.layerMaxXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMinYCorner,.layerMinXMaxYCorner], radius: 10)
        
    }

  
    
}
