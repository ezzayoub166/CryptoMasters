//
//  MainViewController.swift
//  CryptoMasters
//
//  Created by ezz on 30/05/2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var ContentLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var ArrayPost : [data] = []
    
    
    private let url = "https://satco.vip/crypto/api/v1/posts"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata()
        tableView.dataSource = self
        tableView.delegate = self
    }

}
extension MainViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let item = ArrayPost[indexPath.row]
        cell.TitleLabel.text = "\(item.title)"
        cell.ContentLabel.text = "\(item.content)"
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
}
extension MainViewController {
    func setUpView(){
        
    }
    func setUpdata(){
        
    }
    func fetchdata(){
        WebService.shared.sendRequest(url: url, method: .get , isAuth: true) { response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            guard let jsonData = response.data else {return}

            do {
                let x = try JSONDecoder().decode(PostResponse.self, from: jsonData)
                print("data")

                self.ArrayPost = x.data ?? []
                self.tableView.reloadData()
            }
            catch{
                print(error.localizedDescription)


            }


        }
        
        
    }
    
    
    
}
