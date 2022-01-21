//
//  Storyboarded.swift
//  mashi
//
//  Created by moumen isawe on 04/01/2022.
//

 
import UIKit



enum StoryboardName: String {
   case main = "Main"
    case auth = "Auth"

}

protocol Storyboarded {
   static var storyboardIdentifier: String { get }
   static var storyboardName: StoryboardName { get }
   static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
   static var storyboardIdentifier: String {
       return String(describing: Self.self)
   }

   static var storyboardName: StoryboardName {
       return .main
   }

   static func instantiate() -> Self {
       let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: Bundle.main)
       return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
   }
   
}
