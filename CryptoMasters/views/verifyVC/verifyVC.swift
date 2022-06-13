//
//  verifyVC.swift
//  CryptoMasters
//
//  Created by ezz on 22/05/2022.
//

import UIKit

class verifyVC: UIViewController {
// @IBOutlet
    @IBOutlet weak var F1: UITextField!
    
    @IBOutlet weak var F2: UITextField!
    
    @IBOutlet weak var F3: UITextField!
    
    @IBOutlet weak var F4: UITextField!
    
    @IBOutlet weak var F5: UITextField!
    
    
    @IBOutlet weak var F6: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        setupdata()
        loclized()
        fethcdata()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        F1.becomeFirstResponder()
    }
    @IBAction func ButtonVerify(_ sender: Any) {
        //valdation
        
        var text : String? = (F1.text! + F2.text! + F3.text! + F4.text! + F5.text! + F6.text!) ?? ""
        
        if text?.isValid() == true {
        let contoller = RestPassVC.instantiate()
        navigationController?.pushViewController(contoller, animated: true)
        contoller.modalTransitionStyle = .partialCurl
        contoller.modalPresentationStyle = .fullScreen
        present(contoller, animated: true)
    }
        else {
            showAlterPop(massage: "there is mistake", titel: "Wrong!!!", ButtonOkayTitel: "cancal", buttonStyle1: .destructive) {
                self.F1.text = ""
                self.F2.text = ""
                self.F3.text = ""
                self.F4.text = ""
                self.F5.text = ""
                self.F6.text = ""
                
            }
        }
}
}


extension verifyVC {
    func setupview(){
        F1.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        F2.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        F3.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        F4.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        F5.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        F6.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
    }
    func setupdata(){
        
    }
    func loclized(){
        
    }
    func fethcdata(){
        
    }
}
extension verifyVC {  // For other Functions
    @objc func textdidChange(textfield : UITextField){
        let text = textfield.text
        if text?.utf16.count == 1{
            switch textfield {
            case F1 :
                F2.becomeFirstResponder()
                break
            case F2 :
                F3.becomeFirstResponder()
                break
            case F3:
                F4.becomeFirstResponder()
                break
            case F4:
                F5.becomeFirstResponder()
                break
            case F5:
                F6.becomeFirstResponder()
                break
            case F6 :
                F6.resignFirstResponder()
            default :
                break
            }
            
            }
        else {
            
        }
    }
    
    
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
