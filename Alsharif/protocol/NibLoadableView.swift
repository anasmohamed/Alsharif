//
//  NibLoadableView.swift
//  mashi
//
//  Created by moumen isawe on 04/01/2022.
//

 
import UIKit
 protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
