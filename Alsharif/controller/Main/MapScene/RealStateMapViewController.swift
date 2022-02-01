//
//  RealStateMapViewController.swift
//  Alsharif
//
//  Created by no one on 30/01/2022.
//

import UIKit
import YNDropDownMenu
import MapKit
import GoogleMaps
import GooglePlaces
class RealStateMapViewController: UIViewController,FilterBtnTappable {
    func didPressFiltertn() {
        if flateFilterView.isHidden{
            flateFilterView.isHidden = false
        }else{
            flateFilterView.isHidden = true
        }
    }
    
    @IBOutlet weak var flateFilterView: UIView!
    @IBOutlet weak var menuView:HeaderMenuViewController!

    @IBOutlet weak var mapView:GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func filterExitBtnDidTapped(_ sender: Any) {
    
    
    }
    fileprivate func handleLocation() {
        LocationManager.shared.getLocation { location, error in
            if error != nil {
//                self.showNoLocationVC { isActive, loc in
//                    if let locations = loc {
//                        let camera = GMSCameraPosition.camera(withLatitude: locations.coordinate.latitude, longitude:locations.coordinate.longitude, zoom: 12.0)
//                        self.mapView.animate(to: camera)
//                    
//                    }
//                }
            }else{
                let camera = GMSCameraPosition.camera(withLatitude: location!.coordinate.latitude, longitude:location!.coordinate.longitude, zoom: 12.0)
                 
                self.mapView.animate(to: camera)
                
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
