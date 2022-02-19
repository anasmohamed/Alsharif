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
class RealStateMapViewController: UIViewController,FilterBtnTappable, GMSMapViewDelegate ,VillaBtnTappable,FlatesBtnTappable,LandsBtnTappable{
    
    
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
    @IBOutlet weak var realStateImage: UIImageView!
    @IBOutlet weak var realStateTitleLbl: UILabel!
    @IBOutlet weak var realStaePlaceLbl: UILabel!
    @IBOutlet weak var realSatePriceLbl: UILabel!
    @IBOutlet weak var villaFiltter: UIView!
    @IBOutlet weak var landsFiltter: UIView!
    @IBOutlet weak var realSateView: UIViewDesignable!
    
    
    
    var realStatesList = [ApartmentModel]()
    var clickedLocationRealStat : ApartmentModel?
    let db = Firestore.firestore()
    let locationManager = CLLocationManager()
    var cameraPosition = GMSCameraPosition()
    var fillterClickedBtnName = ""
    
    
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
        menuView.fillterDelegate = self
        menuView.flateDelegate = self
        menuView.villaDelegate = self
        menuView.landsDelegate = self
        sellBtn.blackBorder()
        familes.blackBorder()
        twoRoomsBtn.blackBorder()
        applyFilterBtn.layer.cornerRadius = 10
        overrideUserInterfaceStyle = .light

        self.mapView.delegate = self
     //   showRealStatesPlaces()
        realSateView.isHidden = true
                let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 13.0)
                mapView.camera = camera
                mapView.isMyLocationEnabled = true
        
                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
                marker.title = "Sydney"
                marker.snippet = "Australia"
                marker.map = mapView
//        db.collection("Estate").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    let realState = ApartmentModel(EstateType: document["EstateType"] as? String, apartment: document["apartment"] as? String, apartmentArea: document["apartmentArea"] as? String, carPark: document["carPark"] as? String, contact: document["contact"] as? String, details: document["details"]as? String, contract: document["contract"] as? String, elevator: document["elevator"]as? String, tank: document["contract"] as? String, toilet: document["toilet"]as? String, title: document["title"] as? String, latitude: document["latitude"] as? Double, longitude: document["longitude"]as? Double, furnished: document["furnished"] as? String, floor: document["floor"] as? String, room: document["room"] as? String, hall: document["hall"]as? String, electricity: document["electricity"]as? String, frontispiece: document["frontispiece"] as? String, streetWeight: document["frontispiece"]as? String, price: document["price"]as? String, image1: document["image1"]as? String, image2: document["image2"] as? String)
//                    self.realStatesList.append(realState)
//                    print("\(document.documentID) => \(document.data())")
//                }
//                self.showRealStatesPlaces()
//            }
//        }
        // Do any additional setup after loading the view.
    }
    func showRealStatesPlaces()   {
        for data in realStatesList{
            let camera = GMSCameraPosition.camera(withLatitude: data.latitude ?? 0.0, longitude: data.longitude ?? 0.0, zoom: 13.0)
            mapView.camera = camera
            let location = CLLocationCoordinate2D(latitude: data.latitude ?? 0.0, longitude: data.longitude ?? 0.0)
            print("location: \(location)")
            let marker = GMSMarker()
            marker.position = location
            marker.map = mapView
        }
    }
    
    @objc(mapView:didTapMarker:) func mapView(_: GMSMapView, didTap marker: GMSMarker) -> Bool {
        //do something
        
        for data in realStatesList{
            if data.latitude == marker.position.latitude
            {
                realSateView.isHidden = false
                realStateTitleLbl.text = data.title
                realSatePriceLbl.text = data.price
                realStateImage.sd_setImage(with: URL(string: data.image1 ?? ""), completed: nil)
            }
        }
        return true
    }
    @IBAction func filterExitBtnDidTapped(_ sender: Any) {
        
        
    }
    
    func didPressVillaBtn() {
        fillterClickedBtnName = "Villa"
    }
    
    func didPressFlatesBtn() {
        fillterClickedBtnName = "Flates"
        
    }
    
    func didPressLandsBtn() {
        fillterClickedBtnName = "Lands"
        
    }
    
    
    
    func didPressFiltertn() {
        
        switch fillterClickedBtnName {
        case "Flates":
            if flateFilterView.isHidden{
                flateFilterView.isHidden = false
                realSateView.isHidden = true
            }else{
                realSateView.isHidden = false

                flateFilterView.isHidden = true
            }
        case "Villa":
            if villaFiltter.isHidden{
                realSateView.isHidden = true

                villaFiltter.isHidden = false
            }else{
                realSateView.isHidden = false

                villaFiltter.isHidden = true
            }
        case "Lands":
            if landsFiltter.isHidden{
                realSateView.isHidden = true

                landsFiltter.isHidden = false
            }else{
                realSateView.isHidden = false

                landsFiltter.isHidden = true
            }
        default:
            break
        }
        
    }
    
    
    
}
extension RealStateMapViewController:Storyboarded{
    static var storyboardName: StoryboardName = .main
    
}
