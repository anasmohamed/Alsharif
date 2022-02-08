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
import FirebaseFirestore
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
    @IBOutlet weak var rentBtn: UIButton!
    @IBOutlet weak var sellBtn: UIButton!
    @IBOutlet weak var familes: UIButton!
    @IBOutlet weak var singleBtn: UIButton!
    @IBOutlet weak var twoRoomsBtn: UIButton!
    @IBOutlet weak var threeRooms: UIButton!
    @IBOutlet weak var fourRoomsOrMoreBtn: UIButton!
    @IBOutlet weak var applyFilterBtn: UIButton!
    let db = Firestore.firestore()

    @IBAction func applyFilterBtn(_ sender: Any) {
    }
    
    @IBAction func exitFilterBtn(_ sender: Any) {
        flateFilterView.isHidden = true
    }
    
    
    @IBAction func rentBtnFillteDidTapped(_ sender: Any) {
        rentBtn.blackBorder()
        sellBtn.withoutBorder()
    }
    @IBAction func sellBtnFillterDidTapped(_ sender: Any) {
        sellBtn.blackBorder()
        rentBtn.withoutBorder()
    }
    @IBAction func familesBtnFilterDidTapped(_ sender: Any) {
    familes.blackBorder()
        singleBtn.withoutBorder()
    }
    @IBAction func singleBtnFiltterDidTapped(_ sender: Any) {
        singleBtn.blackBorder()
            familes.withoutBorder()
    }
    @IBAction func twoRoomsBtnFiltterDidTapped(_ sender: Any) {
        twoRoomsBtn.blackBorder()
            threeRooms.withoutBorder()
        fourRoomsOrMoreBtn.withoutBorder()
    }
    @IBAction func threeRoomsBtnFillterDidTapped(_ sender: Any) {
        threeRooms.blackBorder()
            twoRoomsBtn.withoutBorder()
        fourRoomsOrMoreBtn.withoutBorder()
    }
    @IBAction func fourRoomsOrMoreBtnFillterDidTapped(_ sender: Any) {
            fourRoomsOrMoreBtn.blackBorder()
            twoRoomsBtn.withoutBorder()
            threeRooms.withoutBorder()
    }
    @IBOutlet weak var mapView:GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.delegate = self
        sellBtn.blackBorder()
        familes.blackBorder()
        twoRoomsBtn.blackBorder()
        applyFilterBtn.layer.cornerRadius = 10
        db.collection("Estate").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
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
