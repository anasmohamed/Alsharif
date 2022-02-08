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
    var realStateList = [RealState]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        db.collection("Estate").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let realState = RealState(EstateType: document["EstateType"] as? String, apartment: document["apartment"] as? String, apartmentArea: document["apartmentArea"] as? String, carPark: document["carPark"] as? String, contact: document["contact"] as? String, details: document["details"]as? String, contract: document["contract"] as? String, elevator: document["elevator"]as? String, tank: document["contract"] as? String, toilet: document["toilet"]as? String, title: document["title"] as? String, latitude: document["latitude"] as? String, longitude: document["longitude"]as? String, furnished: document["furnished"] as? String, floor: document["floor"] as? String, room: document["room"] as? String, hall: document["hall"]as? String, electricity: document["electricity"]as? String, frontispiece: document["frontispiece"] as? String, streetWeight: document["frontispiece"]as? String, price: document["price"]as? String, image1: document["image1"]as? String, image2: document["image2"] as? String)
                    self.realStateList.append(realState)
                    print("\(document.documentID) => \(document.data())  \(realState)")
                    
                }
                self.realStateTableView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }
    func  setupTableView() {
        realStateTableView.delegate = self
        realStateTableView.dataSource = self
        realStateTableView.register(ListOfRealStatesTableViewCell.self)
    }
   
  

}
extension ListOfRealStatesViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realStateList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell :ListOfRealStatesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.realStat = realStateList[indexPath.row]
//        if indexPath.row == 0
//        {
//            cell.realStateImage.image = UIImage(named: "Mask 43Group 1")
//            cell.realStateNae.text = "فيلا دورين مع مسبح وحديقة"
//            cell.realStatePrice.text = "300 SAR"
//            cell.realStatePlace.text = "حي الحمدانية"
//            return cell
//        }else if indexPath.row == 1
//        {
//            cell.realStateImage.image = UIImage(named: "Mask Group 1")
//            cell.realStateNae.text = "شقة 4 غرف وحمامين وصالة"
//            cell.realStatePrice.text = "200 SAR"
//            cell.realStatePlace.text = "حي الفيصلية"
//            return cell
//
//        }
        return cell
    }
    
    
    
}
