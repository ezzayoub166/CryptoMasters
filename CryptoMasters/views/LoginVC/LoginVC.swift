//
//  LoginVC.swift
//  CryptoMasters
//
//  Created by ezz on 21/05/2022.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        loclized()
        fetchdata()
    }
    
    @IBAction func ButtonFB(_ sender: Any) {
        let contoller = ValdationVC.instantiate()
        navigationController?.pushViewController(contoller, animated: true)
        contoller.modalTransitionStyle = .partialCurl
        contoller.modalPresentationStyle = .fullScreen
        present(contoller, animated: true)
        
        
    }
    @IBAction func ButtonLogIN(_ sender: Any) {
        
        
        if (txtPhoneNumber.text?.isValidPhone == true && txtPassword.isValidValue() == true){
            //valdation
            let contoller = verifyVC.instantiate()
            navigationController?.pushViewController(contoller, animated: true)
            contoller.modalTransitionStyle = .partialCurl
            contoller.modalPresentationStyle = .fullScreen
            present(contoller, animated: true)
        }
        
        else if (txtPhoneNumber.text?.isValidPhone == false  && txtPassword.isValidValue() ==  true)
        {
            showAlterPop(massage: "phone Number is Wrong",
                         titel: "Error",
                         ButtonOkayTitel: "Okay",
                         buttonStyle1: .destructive){
                self.txtPhoneNumber.text = ""
            }
        }
        else if (txtPhoneNumber.text?.isValidPhone == true && txtPassword.isValidValue() == false){
            showAlterPop(massage: "plase Enter Your Password",
                         titel: "Empty",
                         ButtonOkayTitel: "Cancel",
                         buttonStyle1: .destructive){
                self.txtPassword.text = ""
            }
        }
        else {
            showAlterPop(massage: "Try Again",
                         titel: "Wrong!!!",
                         ButtonOkayTitel: "Try Again",
                         buttonStyle1: .destructive){
                self.txtPhoneNumber.text = ""
                self.txtPassword.text = ""
            }
        }
        
        
     
        
    }
    @IBAction func ButtonSU(_ sender: Any) {
        //SingUpVC
        let contoller = SingUpVC.instantiate()
        navigationController?.pushViewController(contoller, animated: true)
        contoller.modalTransitionStyle = .partialCurl
        contoller.modalPresentationStyle = .fullScreen
        present(contoller, animated: true)
        
    }
}

extension LoginVC {
    func setupView(){
      
        
    }
    func setupData(){
        
    }
    func loclized(){
        
    }
    func fetchdata(){
        
    }
}
extension LoginVC {
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
