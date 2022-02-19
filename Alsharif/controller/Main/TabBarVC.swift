//
//  TabBarVC.swift
//  Alsharif
//
//  Created by Ali Shaheen on 09/02/2022.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
extension TabBarVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
    
}
