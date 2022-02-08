//
//  HeaderMenuViewController.swift
//  Alsharif
//
//  Created by no one on 25/01/2022.
//

import UIKit
protocol FilterBtnTappable {
    func didPressFiltertn()
}
protocol FlatesBtnTappable {
    func didPressFlatesBtn()
}
protocol VillaBtnTappable {
    func didPressVillaBtn()
}
protocol LandsBtnTappable {
    func didPressLandsBtn()
}
class HeaderMenuViewController: UIViewFromNib {
    
    var fillterDelegate : FilterBtnTappable?
    var flateDelegate : FlatesBtnTappable?

    var villaDelegate : VillaBtnTappable?

    var landsDelegate : LandsBtnTappable?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    final private func setup(){
        self.roundCorners([.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 10)
    }
    @IBAction func filterBtnDidTapped(_ sender: Any) {
        fillterDelegate?.didPressFiltertn()
    }
    
     @IBAction func landsBtnDidTapped(_ sender: Any) {
        landsDelegate?.didPressLandsBtn()
     }
     @IBAction func villaBtnDidTapped(_ sender: Any) {
        villaDelegate?.didPressVillaBtn()
     }
   
    @IBAction func flatesBtnDidTapped(_ sender: Any) {
        flateDelegate?.didPressFlatesBtn()
    }
    
}
