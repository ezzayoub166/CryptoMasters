//
//  RestPassVC.swift
//  CryptoMasters
//
//  Created by ezz on 22/05/2022.
//

import UIKit

class RestPassVC: UIViewController {

    @IBOutlet weak var NewPassword: UITextField!
    
    
    @IBOutlet weak var ConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonReest(_ sender: Any) {
        if ((NewPassword.isValidValue() == true) && (ConfirmPassword.text?.count == NewPassword.text?.count) == true) {
            showAlterPop(massage: "Password changed successfully", titel: "successfu", ButtonOkayTitel: "Go", buttonStyle1: .default) {
                
            }
        }
        else{
            showAlterPop(massage: "There is Wrong", titel: "Wrong", ButtonOkayTitel: "Try Again", buttonStyle1: .cancel) { [self] in
                NewPassword.text = ""
                ConfirmPassword.text = ""
            }
        }
        
    }
    

}

extension RestPassVC {
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
