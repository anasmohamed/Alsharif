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
class HeaderMenuViewController: UIViewFromNib {
    
    var delegate : FilterBtnTappable?
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
        delegate?.didPressFiltertn()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
