//
//  SignUPVC.swift
//  client
//
//  Created by moumen isawe on 04/01/2022.
//

import Foundation
import UIKit

class SignUPVC: UIViewController,AlertsPresenting ,ViewActionDelegate{
    func handle() {
        register()
    }
    

    @IBOutlet weak var LoginCardView:LoginCard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginCardView.delegate = self
         
 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true 
    }
    
    
    
    @IBAction func registerBtnPressed(){
        register()
    }
      private func register(){
        self.navigationController?.pushViewController(SignInVC.instantiate(), animated: true)

          do{
              
              let userPhone = try LoginCardView.userNameTF.validatedText(validationType: .requiredField(field: "User Name"))
              let userPassword = try LoginCardView.userPasswordTF.validatedText(validationType: .requiredField(field: "Password"))
              
//              AuthManager.shared.register(username: userPhone, password: userPassword) {[weak self] result in
//                  guard let self = self else { return  }
//                  switch result{
//                  case .success(let result):
//                       
//                      
//                          if (result.success ?? false) == true{
//                              AppData.token = result.token ?? ""
//                              let vc = self.instantiateViewController(storyboard: .main, vc: "tabBar")
//                              self.sceneDelegate.setRootVC(vc: vc)
//                          }else{
//                              self.showAlert(title: "Mashi", message: "Some error ocured", handler:  nil)
//                          }
//                      
//                  case .failure(let error):
//                      print(error)
//                  }
//              }
              
                
          }catch(let error){
              self.showAlert(title: "Warning", message: (error as! ValidationError).message)
          }
        
          
          
    }
}
extension SignUPVC:Storyboarded{
    static var storyboardName: StoryboardName = .auth
}
