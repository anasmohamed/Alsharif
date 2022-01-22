//
//  ColorSystem.swift
//  mashi
//
//  Created by moumen isawe on 04/01/2022.
//

 

import UIKit
 
enum Color: String, CaseIterable {
    //Base Colors
    case primary = "Primary"
    case gray = "gray"
    case textFieldBackground = "TextFieldBackground"
    case profileCellBorder = "ProfileCellBorder"
  
}
extension UIColor {
    convenience init?(color: Color) {
        self.init(named: color.rawValue)
    }
}
