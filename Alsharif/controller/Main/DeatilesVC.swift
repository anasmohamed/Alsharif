//
//  DeatilesVC.swift
//  Alsharif
//
//  Created by mac on 10/02/2022.
//

import UIKit

class DeatilesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .light

        // Do any additional setup after loading the view.
    }

}
extension DeatilesVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
