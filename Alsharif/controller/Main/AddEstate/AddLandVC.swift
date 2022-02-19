//
//  AddLandVC.swift
//  Alsharif
//
//  Created by Ali Shaheen on 09/02/2022.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import iOSDropDown
import GoogleMaps
class AddLandVC: UIViewController,AlertsPresenting,CLLocationManagerDelegate {
    
    @IBOutlet weak var titleTF: MainTF!
    @IBOutlet weak var contractTF: DropDown!
    @IBOutlet weak var areaTF: MainTF!
    @IBOutlet weak var streetWeightTF: MainTF!
    @IBOutlet weak var pieceNumberTF: MainTF!
    @IBOutlet weak var contactTF: MainTF!
    @IBOutlet weak var priceTF: MainTF!
    @IBOutlet weak var detailsTV: TextViewWithPlaceholder!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var landImage1: UIImageView!
    @IBOutlet weak var landImage2: UIImageView!
    @IBOutlet weak var landImage3: UIImageView!
    @IBOutlet weak var mapView:GMSMapView!
    let db = Firestore.firestore()
    var pickedImage = false
     var imagePicker: ImagePicker!
    private var selectedLocation:CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown()
        cornerRadius()
        shadow()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        overrideUserInterfaceStyle = .light



        // Do any additional setup after loading the view.
    }
    func dropDown() {
        contractTF.optionArray = ["بيع","إيجار"]
    }
    func cornerRadius(){
        detailsTV.layer.cornerRadius = 15
        detailsTV.layer.borderWidth = 1
        detailsTV.layer.borderColor = UIColor.black.cgColor
        detailsTV.layer.cornerRadius = 15
        detailsTV.layer.borderWidth = 1
        detailsTV.layer.borderColor = UIColor.black.cgColor
    }
    func shadow(){
        saveBtn.layer.shadowColor = UIColor.black.cgColor
        saveBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        saveBtn.layer.shadowRadius = 8
        saveBtn.layer.shadowOpacity = 0.5
        saveBtn.layer.masksToBounds = false
    }
    @IBAction func saveAddLandPressed(_ sender: UIButton) {
        do{
            let title = try titleTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال العنوان الشقة "))
        let contract = try contractTF.validatedText(validationType: .requiredField(field: "الرجاء اختيار نوع العقد "))
            let area = try areaTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال مساحة الأرض"))
            let streetWeight = try streetWeightTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال عرض الشارع"))
            let pieceNumber = try pieceNumberTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال رقم القطعة"))
            let contact = try contactTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال رقم التواصل "))
            let price = try priceTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال سعر الأرض "))
            let details = try detailsTV.text.validatedText(validationType: .requiredField(field: "الرجاء ادخال تفاصيل الأرض"))
            self.saveLand(LandModel.init(EstateType: "land", title: title, contract: contract, area: area, streetWeight: streetWeight, contact: contact, price: price, details: details, pieceNumber: pieceNumber, frontispiece: "", longitude: self.selectedLocation.longitude, latitude: self.selectedLocation.latitude, pdf: "", image1: "", image2: ""))
          
            
        }catch(let error){
            self.showAlert(title: "خطأ", message: error.localizedDescription)
        }
    }
    @IBAction func selectImageBtnPressed(_ sender: UIButton) {
        self.imagePicker?.present(from: self.view)

    }
    @IBAction func selectPDFBtnPressed(_ sender: UIButton) {
        self.imagePicker?.present(from: self.view)

    }
    @IBAction func crurrentLocationPressed(_ sender: UIButton) {
        LocationManager.shared.getLocation { [weak self] location, error in
            if let error = error{
                self?.showAlert(title: "خطأ", message: " الرجاء السماح بمشاركة الموقع الحالي ")
                print(error.localizedDescription)
            }
            else{
                if let location = location{
                    self?.cameraMoveToLocation(toLocation: location.coordinate)
                }
            }
        }
    }
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            mapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
            let marker = GMSMarker()
            self.selectedLocation = toLocation!
            marker.position = toLocation!
            marker.map = mapView
        }
    }


    func saveLand(_ land:LandModel){
        let docData:[String:Any] = [
            "EstateType":land.EstateType,
            "title":land.title,
            "contract":land.contract,
            "area":land.area,
            "streetWeight":land.streetWeight,
            "contact":land.contact,
            "price":land.price,
            "details":land.details,
            "pieceNumber":land.pieceNumber,
            "frontispiece":land.frontispiece,
            "longitude":land.longitude,
            "latitude":land.latitude,
            "pdf":land.pdf,
            "image1":land.image1,
            "image2":land.image2,
        ]
        let documentID =  UUID().uuidString
        db.collection("Estate").document(documentID).setData(docData){ err in
            if let err = err {
                self.showAlert(title: "خطأ", message: err.localizedDescription)
            } else {

                self.showAlert(title: "نجاح", message: "تم اضافة العملية بنجاح ")
            }
        }
    }
}

extension AddLandVC: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if let image = image {
            DispatchQueue.main.async {
                self.landImage1.image  = image
                self.landImage1.contentMode = .scaleAspectFill
            }
        }
    }
}
extension AddLandVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
    
}
extension AddLandVC: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        // Custom logic here
        mapView.clear()
        self.selectedLocation = coordinate
                let marker = GMSMarker()
        marker.position = coordinate
        marker.map = mapView
        
    }
}
