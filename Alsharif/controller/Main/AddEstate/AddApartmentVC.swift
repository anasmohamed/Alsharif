//
//  AddApartmentVC.swift
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

class AddApartmentVC: UIViewController,AlertsPresenting,CLLocationManagerDelegate {
    @IBOutlet weak var titleTF: MainTF!
    @IBOutlet weak var contractTF: DropDown!
    @IBOutlet weak var paymentTF: DropDown!
    @IBOutlet weak var apartmentTypeTF: DropDown!
    @IBOutlet weak var furnishedTF: DropDown!
    @IBOutlet weak var carParkTF: DropDown!
    @IBOutlet weak var elevatorTF: DropDown!
    @IBOutlet weak var frontispieceTF: DropDown!
    @IBOutlet weak var floorTF: MainTF!
    @IBOutlet weak var roomTF: MainTF!
    @IBOutlet weak var hallTF: MainTF!
    @IBOutlet weak var toiletTF: MainTF!
    @IBOutlet weak var tankTF: DropDown!
    @IBOutlet weak var electricityTF: DropDown!
    @IBOutlet weak var apartmentAreaTF: MainTF!
    @IBOutlet weak var streetWeightTF: MainTF!
    @IBOutlet weak var contactTF: MainTF!
    @IBOutlet weak var priceTF: MainTF!
    @IBOutlet weak var detailsTV: TextViewWithPlaceholder!
    @IBOutlet weak var apartmentImage1: UIImageView!
    @IBOutlet weak var apartmentImage2: UIImageView!
    @IBOutlet weak var apartmentImage360: UIImageView!
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

        // Do any additional setup after loading the view.
    }
    func dropDown() {
        contractTF.optionArray = ["بيع","إيجار"]
        paymentTF.optionArray = ["شهري","سنوي"]
        apartmentTypeTF.optionArray = ["عوائل","عزاب"]
        furnishedTF.optionArray = ["نعم","لا"]
        carParkTF.optionArray = ["نعم","لا"]
        elevatorTF.optionArray =  ["نعم","لا"]
        tankTF.optionArray =  ["مستقل","مشترك"]
        electricityTF.optionArray =  ["مستقل","مشترك"]
        frontispieceTF.optionArray =  ["شمال","جنوب","شرق","غرب"]

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
    
    
    @IBAction func saveAddApartmentPressed(_ sender: UIButton) {
        do{
            let title = try titleTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال العنوان الشقة "))
        let contract = try contractTF.validatedText(validationType: .requiredField(field: "الرجاء اختيار نوع العقد "))
            let payment = try paymentTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال نظام الدفع"))
            let apartmentType = try apartmentTypeTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال نوع الشقة"))
            let furnished = try furnishedTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال هل الشقة مفروشة ام لا "))
            let carPark = try carParkTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال هل يوجد  موقف سيارة"))
            let elevator = try elevatorTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال هل يوجد مصعد"))
            let floor = try floorTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال عدد الادوار"))
            let room = try roomTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال عددالغرف"))
            let hall = try hallTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال عدد الصالات "))
            let toilet = try toiletTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال عدد دورات المياه"))
            let tank = try tankTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال خزان المياه "))
            let electricity = try electricityTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال عداد الكهرباء  "))
            let  apartmentArea = try apartmentAreaTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال مساحة الشقة   "))
            let streetWeight = try streetWeightTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال عرض الشارع "))
            let contact = try contactTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال رقم التواصل   "))
            let price = try priceTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال سعر الفيلا  "))
            let details = try detailsTV.text.validatedText(validationType: .requiredField(field: "الرجاء ادخال تفاصبل الفيلا "))
            let frontispiece = try frontispieceTF.validatedText(validationType: .requiredField(field: "الرجاء ادخال تفاصبل الفيلا "))

            self.saveApartment(ApartmentModel.init(EstateType: "apartment", title: title, contract: contract, payment: payment, apartment:apartmentType , furnished: furnished, carPark: carPark, elevator: elevator, floor: floor, room: room, hall: hall, toilet: toilet, apartmentArea: apartmentArea, tank: tank, electricity: electricity, frontispiece: frontispiece, streetWeight: streetWeight, contact: contact, price: price, details: details, longitude: self.selectedLocation.longitude, latitude: self.selectedLocation.latitude, image360: "", image1: "", image2: ""))
            
        }catch(let error){
            self.showAlert(title: "خطأ", message: error.localizedDescription)
        }
        
       
        
    }
    @IBAction func selectImageBtnPressed(_ sender: UIButton) {
        self.imagePicker?.present(from: self.view)

    }
    @IBAction func selectImage360BtnPressed(_ sender : UIButton){
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

    
    
    func saveApartment(_ apartment:ApartmentModel){
        let docData:[String:Any] = [
            "EstateType":apartment.EstateType,
            "title":apartment.title,
            "contract":apartment.contract,
            "payment":apartment.payment,
            "apartment":apartment.apartment,
            "furnished":apartment.furnished,
            "carPark":apartment.carPark,
            "elevator":apartment.elevator,
            "floor":apartment.floor,
            "room":apartment.room,
            "hall":apartment.hall,
            "toilet":apartment.toilet,
            "apartmentArea":apartment.apartmentArea,
            "tank":apartment.tank,
            "electricity":apartment.electricity,
            "frontispiece":apartment.frontispiece,
            "streetWeight":apartment.streetWeight,
            "contact":apartment.contact,
            "price":apartment.price,
            "details":apartment.details,
            "longitude":apartment.longitude,
            "latitude":apartment.latitude,
            "image360":apartment.image360,
            "image1":apartment.image1,
            "image2":apartment.image2,
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
extension AddApartmentVC: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if let image = image {
            DispatchQueue.main.async {
                self.apartmentImage1.image  = image
                self.apartmentImage1.contentMode = .scaleAspectFill
            }
        }
    }
}

extension AddApartmentVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
    
}
extension AddApartmentVC: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        // Custom logic here
        mapView.clear()
        self.selectedLocation = coordinate
                let marker = GMSMarker()
        marker.position = coordinate
        marker.map = mapView
        
    }
}
