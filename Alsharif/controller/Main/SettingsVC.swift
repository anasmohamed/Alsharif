//
//  SettingsVC.swift
//  client
//
//  Created by Ali Shaheen on 06/01/2022.
//

import Foundation
import UIKit

class SettingsVC: UIViewController ,AlertsPresenting{
    @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingTVC.self)
        tableView.estimatedRowHeight = 60
        overrideUserInterfaceStyle = .light
//        self.navigationController?.setStatusBar(backgroundColor: UIColor(color: .primary)!)
         
          }

    
    
    enum ProfileContent:String{
        case myAccount = "حسابي"
        case myads = "إعلاناتي"
        case notification = "الاشعارات"
        case support = "الدعم الفني"
        case privacyPolicy = "سياسة الخصوصية"
        static let all:[ProfileContent] = [.myAccount,.myads,.notification,.support,.privacyPolicy ]
        
        var icone:UIImage{
            switch self {
            case .myAccount:
                return UIImage(named:"myAccount" )!
            case .myads:
                return UIImage(named: "myads")!
            case .notification:
                return UIImage(named:"notification" )!
            case .support:
                return UIImage(named:"support" )!
            case .privacyPolicy:
                return UIImage(named:"privacy" )!

            }
            
        }
    }

}

extension SettingsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileContent.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SettingTVC = tableView.dequeueReusableCell(for: indexPath)
        let item = ProfileContent.all[indexPath.row]
        cell.titleLbl.text = item.rawValue
        cell.iconImageView.image = item.icone
        return cell
    }
 
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch ProfileContent.all[indexPath.row]{
//        default:
//            self.showAlert(title: "الشريف للعقارات", message: "غير مضاف بعد", handler: nil)
//        }
//    }
    
 
}
extension SettingsVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
