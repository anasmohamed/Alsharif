//
//  UIViewDesignable.swift
//  client
//
//  Created by no one on 05/01/2022.
//

 import UIKit

@IBDesignable
class UIViewDesignable: UIView {
    
    
    @IBInspectable var cornerRadius: CGFloat = 0
    
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor.black
    
    @IBInspectable var shadowRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor = UIColor.gray
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    @IBInspectable var shadowOpacity: Float = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        layer.cornerRadius = cornerRadius
        self.roundCorners([.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: cornerRadius)

        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
//        layer.shadowRadius = shadowRadius
//        layer.shadowColor = shadowColor.cgColor
//        layer.shadowOffset = shadowOffset
//        layer.shadowOpacity = shadowOpacity
    }
    @IBAction func verifyOtpBtnPressed(_ sender: Any) {
        
    }
}
