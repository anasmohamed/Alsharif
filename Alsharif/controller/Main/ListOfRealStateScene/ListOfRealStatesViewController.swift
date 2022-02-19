//
//  ListOfRealStatesViewController.swift
//  Alsharif
//
//  Created by no one on 27/01/2022.
//

import UIKit
import FirebaseFirestore
class ListOfRealStatesViewController: UIViewController {
    @IBOutlet weak var realStateTableView: UITableView!
    
    let db = Firestore.firestore()
    var realStateList = [ApartmentModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setupTableView()
        getAllData()
//        db.collection("Estate").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    let realState = ApartmentModel(EstateType: document["EstateType"] as? String, apartment: document["apartment"] as? String, apartmentArea: document["apartmentArea"] as? String, carPark: document["carPark"] as? String, contact: document["contact"] as? String, details: document["details"]as? String, contract: document["contract"] as? String, elevator: document["elevator"]as? String, tank: document["contract"] as? String, toilet: document["toilet"]as? String, title: document["title"] as? String, latitude: document["latitude"] as? Double, longitude: document["longitude"]as? Double, furnished: document["furnished"] as? String, floor: document["floor"] as? String, room: document["room"] as? String, hall: document["hall"]as? String, electricity: document["electricity"]as? String, frontispiece: document["frontispiece"] as? String, streetWeight: document["frontispiece"]as? String, price: document["price"]as? String, image1: document["image1"]as? String, image2: document["image2"] as? String)
//                    self.realStateList.append(realState)
//                    print("\(document.documentID) => \(document.data())  \(realState)")
//                    
//                }
//                self.realStateTableView.reloadData()
//            }
//        }
//        
        // Do any additional setup after loading the view.
    }
    func  setupTableView() {
        realStateTableView.delegate = self
        realStateTableView.dataSource = self
        realStateTableView.register(ListOfRealStatesTableViewCell.self)
        realStateTableView.estimatedRowHeight = 60

    }
    func getAllData(){
        db.collection("").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
        }
            for doc in documents {
                let  estateType  = doc.data()["EstateType"] as? String
                let title =  doc.data()["title"]  as? String
                let  area = doc.data()["apartmentArea"]  as? String
                let price = doc.data()["price"] as? String
                let  estate =  ApartmentModel.init(EstateType: estateType, title: title ?? "" , contract: "" , payment: "", apartment: "", furnished: "", carPark: "", elevator: "", floor: "", room: "", hall: "", toilet: "", apartmentArea: area ?? "", tank: "", electricity: "", frontispiece: "", streetWeight: "", contact: "", price: price ?? "" , details: "", longitude: 0.0, latitude: 0.0, image360: "", image1: "", image2: "")
                self.realStateList.append(estate)
                self.realStateTableView.reloadData()
            }

    }
        
    }
    
}
extension ListOfRealStatesViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realStateList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell :ListOfRealStatesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.realStat = realStateList[indexPath.row]
        if indexPath.row == 0
        {

        }else if indexPath.row == 1
        {
            cell.realStateImage.image = UIImage(named: "Mask Group 1")
            cell.realStateNae.text = "شقة 4 غرف وحمامين وصالة"
            cell.realStatePrice.text = "200 SAR"
            cell.realStatePlace.text = "حي الفيصلية"
            return cell

        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = DeatilesVC.instantiate()
        self.sceneDelegate.setRootVC(vc: vc)
    }
    
    
}
extension ListOfRealStatesViewController:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
