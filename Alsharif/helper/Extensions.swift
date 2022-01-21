//
//  Extensions.swift
//  client
//
//  Created by moumen isawe on 04/01/2022.
//

import UIKit
import ProgressHUD

extension UIView {
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        if #available(iOS 11, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            var cornerMask = UIRectCorner()
            if(corners.contains(.layerMinXMinYCorner)){
                cornerMask.insert(.topLeft)
            }
            if(corners.contains(.layerMaxXMinYCorner)){
                cornerMask.insert(.topRight)
            }
            if(corners.contains(.layerMinXMaxYCorner)){
                cornerMask.insert(.bottomLeft)
            }
            if(corners.contains(.layerMaxXMaxYCorner)){
                cornerMask.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerMask, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
extension UIView{
    func setBorder(with color:UIColor,width:CGFloat){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.1,
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur: CGFloat = 9,
        spread: CGFloat = 0 )
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

extension UIViewController{
    var sceneDelegate:SceneDelegate{
        return (self.view.window?.windowScene?.delegate)! as! SceneDelegate
    }
    @IBAction func endVC(){
        DispatchQueue.main.async {
            if let navigation = self.navigationController{
                navigation.popViewController(animated: true)
            }else{            self.dismiss(animated: true, completion: nil)}
        }
        
    }
    
    func instantiateViewController(storyboard:StoryboardName,vc:String)->UIViewController{
        let storyboard = UIStoryboard(name:storyboard.rawValue , bundle: nil)
        return storyboard.instantiateViewController(withIdentifier:vc)
        
    }
    func showHUD() {
        ProgressHUD.animationType = .systemActivityIndicator;
        ProgressHUD.colorBackground = .lightGray
        ProgressHUD.colorAnimation = .systemBlue
        ProgressHUD.colorProgress = .systemBlue

        
        
        ProgressHUD.show()

   }
    func addTitle(title:String)
{
    let label = UILabel()
    label.text = title
    label.textColor = UIColor.white
    
    navigationItem.titleView = label
    self.tabBarController?.tabBar.barTintColor = .black
}
    
    func hideHUD(){
        ProgressHUD.dismiss()
 
    }
    
    
}

extension UINavigationController {

    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }

}




extension SceneDelegate{
    func setRootVC(vc:UIViewController){
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
}


extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)

        // Swift 4.2 and above
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)

        // Swift 4.1 and below
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    func setFontForText(textForAttribute: String, withFont font: UIFont) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)

        // Swift 4.2 and above
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
 
    }
}
