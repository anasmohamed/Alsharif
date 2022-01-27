//
//  SignInVC.swift
//  client
//
//  Created by moumen isawe on 05/01/2022.
//

import Foundation
import UIKit

class SignInVC: UIViewController,AlertsPresenting ,NextViewDelegate{
    func handlePushingViewController() {
        
    }
    
    @IBOutlet weak var otpCardView:OTPCard!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        otpCardView.delegate = self
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
    @IBAction func loginBtnPressed(){
//        login()
        
         login()

    }
    
   
    @IBAction func showRegisterBtnPressed(){
        self.navigationController?.pushViewController(UserNameViewController.instantiate(), animated: true)
    }
    
      private func login(){
      
          
          do{
              
//              let userPhone = try otpCardView.userNameTF.validatedText(validationType: .requiredField(field: "User Name"))
//              let userPassword = try otpCardView.userPasswordTF.validatedText(validationType: .requiredField(field: "Password"))
//              AuthManager.shared.login(username: userPhone, password: userPassword) { [weak self] result in
//                  guard let self = self else { return  }
//                  switch result{
//                  case .success(let loginModel):
//                      
//                      if let message = loginModel.message{
//                          self.showAlert(title: "Mashi", message:message, handler: nil)
//                      }else{
//                          AppData.token = loginModel.token ?? ""
//                          let vc = self.instantiateViewController(storyboard: .main, vc: "tabBar")
//                          self.sceneDelegate.setRootVC(vc: vc )
//                      }
//                      
//                  case .failure(let error):
//                      self.showAlert(title: "Mashi", message: error.localizedDescription, handler: nil)
//                  }
//              }
                
          }catch(let error){
              self.showAlert(title: "Warning", message: (error as! ValidationError).message)
          }
        
          
          
    }
 

}
extension SignInVC:Storyboarded{
    static var storyboardName: StoryboardName = .auth
}
