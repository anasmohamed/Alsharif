//
//  AddFarmVC.swift
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

class AddFarmVC: UIViewController,AlertsPresenting,CLLocationManagerDelegate {
    
    
    @IBOutlet weak var titleTF: MainTF!
    @IBOutlet weak var contractTF: DropDown!
    @IBOutlet weak var areaTF: MainTF!
    @IBOutlet weak var numberOfWellsTF: MainTF!
    @IBOutlet weak var numberOfPalmsTF: MainTF!
    @IBOutlet weak var contactTF: MainTF!
    @IBOutlet weak var priceTF: MainTF!
    @IBOutlet weak var detailsTV: TextViewWithPlaceholder!
    @IBOutlet weak var farmImage1: UIImageView!
    @IBOutlet weak var farmImage2: UIImageView!
    @IBOutlet weak var farmImage3: UIImageView!
    @IBOutlet weak var saveBtn: UIButton!
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
    
    @IBAction func saveAddFarmPressed(_ sender: UIButton) {
        do{
            let title = try titleTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال العنوان الشقة "))
        let contract = try contractTF.validatedText(validationType: .requiredField(field: "الرجاء اختيار نوع العقد "))
            let area = try areaTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال مساحة المزرعة"))
            let numberOfWells = try numberOfWellsTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال عدد النخيل "))
            let numberOfPalms = try numberOfPalmsTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال عدد الابار"))
            let contact = try contactTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال رقم التواصل "))
            let price = try priceTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال السعر المزرعة"))
            let details = try detailsTV.text.validatedText(validationType: .requiredField(field: "الرجاء ادخال تفاصيل المزرعة"))

            self.saveFram(FarmModel.init(EstateType: "farm", title: title, contract: contact, area: area, numberOfWells: numberOfWells, numberOfPalms: numberOfPalms, contact: contact, price: price, details: details, longitude: self.selectedLocation.longitude, latitude: self.selectedLocation.latitude, image1: "", image2: "", image3: ""))
            
        }catch(let error){
            self.showAlert(title: "خطأ", message: error.localizedDescription)
        }
    }
    @IBAction func selectImageBtnPressed(_ sender: UIButton) {
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

    
    func saveFram(_ fram:FarmModel){
        let docData:[String:Any] = [
            "EstateType":fram.EstateType ?? "",
            "title":fram.title ,
            "contract":fram.contract,
            "area":fram.area,
            "numberOfWells":fram.numberOfWells,
            "numberOfPalms":fram.numberOfPalms,
            "contact":fram.contact,
            "price":fram.price ,
            "details":fram.details,
            "longitude":fram.longitude,
            "latitude":fram.latitude,
            "image1":fram.image1 ,
            "image2":fram.image2,
            "image3":fram.image3,
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
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            mapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
            let marker = GMSMarker()
            self.selectedLocation = toLocation!
            marker.position = toLocation!
            marker.map = mapView
        }
    }

}
extension AddFarmVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
    
}
extension AddFarmVC: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if let image = image {
            DispatchQueue.main.async {
                self.farmImage1.image  = image
                self.farmImage1.contentMode = .scaleAspectFill
            }
        }
    }
}
extension AddFarmVC: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        // Custom logic here
        mapView.clear()
        self.selectedLocation = coordinate
                let marker = GMSMarker()
        marker.position = coordinate
        marker.map = mapView
        
    }
}
