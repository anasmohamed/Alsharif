//
//  AlertsPresenting.swift
//  mashi
//
//  Created by moumen isawe on 04/01/2022.
//

import Foundation
import UIKit
protocol AlertsPresenting: UIViewController {
}

extension AlertsPresenting {
   func showAlert(title: String?, message: String?,handler: ((UIAlertAction) -> Void)? = nil){

       assert((title ?? message) != nil, "Title OR message must be passed in")

       let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
       ac.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,    handler: handler))
       present(ac, animated: true)
   }
  
}

 
