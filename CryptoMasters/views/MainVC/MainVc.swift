//
//  MainVc.swift
//  CryptoMasters
//
//  Created by ezz on 22/05/2022.
//

import UIKit

class MainVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonLogin(_ sender: Any) {
        
            let controller = LoginVC.instantiate()
            navigationController?.pushViewController(controller, animated: true)
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .partialCurl
        
        
        present(controller, animated: true)
        

        }
    }
