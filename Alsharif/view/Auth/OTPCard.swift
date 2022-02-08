//
//  OTPCard.swift
//  Alsharif
//
//  Created by no one on 22/01/2022.
//

import UIKit
@IBDesignable
class OTPCard: UIViewFromNib {
    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var otpNum1:OtpTF!
    @IBOutlet weak var otpNum2:OtpTF!
    @IBOutlet weak var otpNum3:OtpTF!
    @IBOutlet weak var otpNum4:OtpTF!
    
    var delegate : NextViewDelegate?
    @IBInspectable var labelTitle: String? = nil{
        didSet{
            self.label.text = labelTitle
        }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
     }

    final private func setup(){
        self.roundCorners([.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner], radius: 10)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


}

