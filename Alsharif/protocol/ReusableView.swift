//
//  ReusableView.swift
//  mashi
//
//  Created by no one on 04/01/2022.
//

import Foundation
import UIKit
protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

