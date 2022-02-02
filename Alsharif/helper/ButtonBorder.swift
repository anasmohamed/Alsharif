//
//  ButtonBorder.swift
//  Alsharif
//
//  Created by no one on 02/02/2022.
//

import Foundation
import UIKit
extension UIButton{
    func blackBorder()  {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
    }
    func withoutBorder()  {
        self.layer.borderWidth = 0
    }
}
