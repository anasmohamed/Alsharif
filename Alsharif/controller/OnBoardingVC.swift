//
//  OnBordingVC.swift
//  client
//
//  Created by no one on 04/01/2022.
//

import UIKit

class OnBoardingVC: UIViewController {
    
     
    @IBOutlet weak var onBoardingDescriptionLbl:UILabel!
    @IBOutlet weak var pageControl:UIPageControl!
    @IBOutlet weak var skipLbl:UILabel!
    @IBOutlet weak var nextBtn:UIButton!
    @IBOutlet weak var onBoardinImage:UIImageView!

    @IBOutlet weak var secondImage: UIImageView!
    
    
    private var currentIndex = 0
    let data = [OnBoarding(image: UIImage(named: "splash-1")!, description: "تطبيق الشريف للعقارات",isTwoImage: false)
                ,OnBoarding(image: UIImage(named: "splash-2")!, description:  "المكان الأنسب لك للبحث عن اي عقار تحتاجه", isTwoImage: true)
     
                ,OnBoarding(image: UIImage(named: "splash-3")!, description: "ابدأ رحلة البحث عن العقارات الآن وسجل في التطبيق",isTwoImage: false)
                

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light

        // Do any additional setup after loading the view.
        self.setupData(with: data[currentIndex])
         
    }
    

    @IBAction func nextBtnPressed(){
        currentIndex += 1
         
         
        if currentIndex  == data.count {
            // next step will be home
            changeRoot()
            
        }else if currentIndex <= data.count - 1 {
            self.setupData(with: data[currentIndex])
            
        }else{
            fatalError("Unreachable index")
        }
        
    }
    
    
  
    func setupData(with data:OnBoarding){
        
        self.onBoardinImage.image = data.image
        self.onBoardingDescriptionLbl.text = data.description
//        self.skipLbl.text = data.skipBtnTitle
        if data.isTwoImage{
            self.secondImage.isHidden = false
        }else{
            self.secondImage.isHidden = true
        }
        self.pageControl.currentPage = currentIndex
    }
    fileprivate func changeRoot() {
        AppData.isFirstOpen = false
        
       let vc = UINavigationController(rootViewController: SignInVC.instantiate())
    //    let vc =  TabBarVC.instantiate()
        self.sceneDelegate.setRootVC(vc: vc)
    }
    
    @IBAction func skipBtnPressed(){
        changeRoot()
        
    }
    struct OnBoarding{
        let image : UIImage
        let description: String
        let isTwoImage: Bool
    }
}
