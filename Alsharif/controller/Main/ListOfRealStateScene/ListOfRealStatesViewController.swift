//
//  ListOfRealStatesViewController.swift
//  Alsharif
//
//  Created by no one on 27/01/2022.
//

import UIKit

class ListOfRealStatesViewController: UIViewController {
    @IBOutlet weak var realStateTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        GeneralNetworkManager.shared.getAllRealties { result in
            self.hideHUD()
            switch result{
            case .success(let realState):
                print(realState)
//                self.data = order.data ?? []
            case .failure(let error):
                print(error)
//                self.showAlert(title: "Mashi", message: error.localizedDescription, handler: nil)
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
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :ListOfRealStatesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
    
}
