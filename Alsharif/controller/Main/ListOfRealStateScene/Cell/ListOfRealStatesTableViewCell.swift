//
//  listOfRealStatesTableViewCell.swift
//  Alsharif
//
//  Created by no one on 27/01/2022.
//

import UIKit
import SDWebImage
class ListOfRealStatesTableViewCell: UITableViewCell,NibLoadableView,ReusableView {

    @IBOutlet weak var realStatePlace: UILabel!
    @IBOutlet weak var realStatePrice: UILabel!
    @IBOutlet weak var realStateNae: UILabel!
    @IBOutlet weak var realStateImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    var realStat : RealState?{
        didSet{
//            realStatePlace.text = realStat.
            realStateNae.text = realStat?.title
            realStatePrice.text = (realStat?.price ?? "0") + " SAR"
            realStateImage.sd_setImage(with: URL(string: realStat?.image1 ?? ""), completed: nil)
        }
    }
    
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
