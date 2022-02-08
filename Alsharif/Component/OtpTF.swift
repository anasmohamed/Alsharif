//
//  OtpTF.swift
//  Alsharif
//
//  Created by no one on 22/01/2022.
//

import Foundation
import UIKit.UITextField

@IBDesignable
open class OtpTF: UITextField   {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    var padding = UIEdgeInsets(top: 0, left: 10 , bottom: 0, right: 10)
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    final func setup() {
        //        self.roundCorners([.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner], radius: )
        self.layer.cornerRadius = self.bounds.height/4
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(color: .textFieldBackground)
        self.textAlignment = .center
        borderStyle = .roundedRect
        placeHolderColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
}
import UIKit
private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let t = textField.text {
            textField.text = String(t.prefix(maxLength))
        }
    }
}
