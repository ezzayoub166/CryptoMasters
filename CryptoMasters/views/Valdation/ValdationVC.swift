//
//  ValdationVC.swift
//  CryptoMasters
//
//  Created by ezz on 22/05/2022.
//

import UIKit

class ValdationVC: UIViewController {

    @IBOutlet weak var textfieldPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonSing(_ sender: Any) {
        if textfieldPhoneNumber.text?.isValidPhone == true {
        
        showAlterPop(massage: "Successfully registered", titel: "Successf", ButtonOkayTitel: "OK", buttonStyle1: .default) {
            let contoller = verifyVC.instantiate()
            self.navigationController?.pushViewController(contoller, animated: true)
            contoller.modalTransitionStyle = .partialCurl
            contoller.modalPresentationStyle = .fullScreen
            self.present(contoller, animated: true)
        }
        }
        else {
            showAlterPop(massage: "there Wrong", titel: "Error", ButtonOkayTitel: "cancal", buttonStyle1: .destructive) {
                self.textfieldPhoneNumber.text = ""
                
            }
            
        }
     
        
    }
    
}

extension ValdationVC {

        func showAlterPop(Title : String , Message : String  ){
            let Alter = UIAlertController.init(title: Title, message: Message, preferredStyle: .alert)
            self.present(Alter, animated: true, completion: nil)
        }
        func showAlterPop(massage : String , titel : String , ButtonOkayTitel : String = "Okay", buttonStyle1 : UIAlertAction.Style = .default , Action1 ButtonTitelAction : @escaping ()-> Void) {
            
            let alter = UIAlertController.init(title: titel, message: massage, preferredStyle: .alert)
            let button1 = UIAlertAction.init(title: ButtonOkayTitel,style:  buttonStyle1) {
              (action) in
                print("Button Okay")
                ButtonTitelAction()
                
            }
            alter.addAction(button1)
            self.present(alter, animated: true, completion: nil)
            
            
            
        }
    }
