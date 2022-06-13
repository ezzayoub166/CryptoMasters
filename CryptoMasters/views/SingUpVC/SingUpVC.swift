//
//  SingUpVC.swift
//  CryptoMasters
//
//  Created by ezz on 21/05/2022.
//

import UIKit

class SingUpVC: UIViewController {

    @IBOutlet weak var buttonCheck: UIButton!
    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
    
    var flag = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func ButtonSingUp(_ sender: Any) {
        let contoller = verifyVC.instantiate()
        navigationController?.pushViewController(contoller, animated: true)
        contoller.modalTransitionStyle = .partialCurl
        contoller.modalPresentationStyle = .fullScreen
        present(contoller, animated: true)
    }
    
    @IBAction func buttoncheck(_ sender: UIButton) {
       
        if (flag == false )
        {
            sender.setBackgroundImage(UIImage(named: "tick"), for: UIControl.State.normal)
            flag = true
        }
        else {
            sender.setBackgroundImage(UIImage(named: "stop"), for: UIControl.State.normal)
            flag = false
        }
        
    }
    
    @IBAction func ButtonSing(_ sender: Any) {
        if ((txtPhoneNumber.text?.isValidPhone == true && txtPassword.isValidValue() == true ) && ((txtConfirmPassword.text?.count == txtPassword.text?.count) == true ) && (txtName.isValidValue() == true) )
             {
            self.showAlterPop(massage: "Successfully registered", titel: "Sucess", ButtonOkayTitel: "Next", buttonStyle1: .default) {
                self.txtName.text = ""
                self.txtPassword.text = ""
                self.txtConfirmPassword.text = ""
                self.txtPhoneNumber.text = ""
                
                
            }
             }
//        }
//        else if ((txtPhoneNumber.text?.isValidPhone == false && txtPassword.isValidValue() == true ) && ((txtConfirmPassword.text?.count == txtPassword.text?.count) == true ) && (txtName.isValidValue() == true) ){
//            showAlterPop(massage: "Phone Number ", titel: "Faild", ButtonOkayTitel: "Edit Phone Number", buttonStyle1: .destructive) {
//                self.txtPhoneNumber.text = ""
//            }
//            }
//        else if ((txtPhoneNumber.text?.isValidPhone == true && txtPassword.isValidValue() == false ) && ((txtConfirmPassword.text?.count == txtPassword.text?.count) == true ) && (txtName.isValidValue() == true) ){
//            showAlterPop(massage: "Wrong Password", titel: "Faild", ButtonOkayTitel: "Cancal", buttonStyle1: .destructive) {
//                self.txtPassword.text = ""
//                self.txtConfirmPassword.text = ""
//            }
//            }
//        else if ((txtPhoneNumber.text?.isValidPhone == true && txtPassword.isValidValue() == true ) && ((txtConfirmPassword.text?.count == txtPassword.text?.count) == false ) && (txtName.isValidValue() == true) ){
//            showAlterPop(massage: "the Password And Confirm Password Not equal to some", titel: "Wrong Password", ButtonOkayTitel: "Cancal", buttonStyle1: .destructive) {
//                self.txtPassword.text = ""
//                self.txtConfirmPassword.text = ""
//            }
//            }
        else {
            self.showAlterPop(massage: "there is Error", titel: "Wrong!!", ButtonOkayTitel: "Cancal", buttonStyle1: .destructive) { [self] in
                if self.txtName.isValidValue() == false {
                    self.showAlterPop(massage: "Name is Empty", titel: "wrong Name") {
                        self.txtName.text = ""
                    }
                    if self.txtPhoneNumber.text?.isValidPhone == false {
                        self.showAlterPop(massage: "Phone Number  is Wrong", titel: "wrong Phone Number ") {
                            self.txtName.text = ""
                        }
                    }
                        if self.txtPassword.isValidValue() == false {
                            self.showAlterPop(massage: "Password is Wrong", titel: "wrong Password") {
                                self.txtPassword.text = ""
                                self.txtConfirmPassword.text = ""
                            }
                        }
                    if (self.txtConfirmPassword.text?.count == self.txtPassword.text?.count) == true {
                                self.showAlterPop(massage: "text is Empty", titel: "wrong Name") {
                                    self.txtPassword.text = ""
                                    self.txtConfirmPassword.text = ""
                                }
                            }
                    
                }
            }
        }
        }
    }

extension SingUpVC {
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
