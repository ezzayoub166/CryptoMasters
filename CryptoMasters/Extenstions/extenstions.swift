//
//  extenstions.swift
//  CryptoMasters
//
//  Created by ezz on 21/05/2022.
//

import Foundation
import UIKit
import Kingfisher
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
       let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
       self.layer.mask = mask
    }
    
        @IBInspectable var isRounded : Bool {
            set {
                self.layer.cornerRadius = self.frame.height / 2
                
            }
            get {
                return self.layer.cornerRadius == self.frame.height / 2
            }
        }
}

@IBDesignable

class DesignableViewCustomCorner: UIView {

    @IBInspectable var cornerRadious: CGFloat = 0 {
        didSet {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: cornerRadious, height: cornerRadious))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }

}
extension UIButton {
    @IBInspectable override var isRounded : Bool {
        set {
            self.layer.cornerRadius = self.frame.height / 2
            
        }
        get {
            return self.layer.cornerRadius == self.frame.height / 2
        }
    }
}
extension UIViewController {
    
    static var identifier : String {
        return String(describing:  self )
    }

    static func instantiate() -> Self {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        return storybord.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
extension String {
    
    var image__ : UIImage? {
        return UIImage.init(named: self)
        
    }
    
    var asURl : URL? {
        return URL(string: self )
    }
    
   var isValidEmail: Bool {
      let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
      return testEmail.evaluate(with: self)
   }
   var isValidPhone: Bool {
      let regularExpressionForPhone = "^\\d{4}\\d{4}$"
      let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
      return testPhone.evaluate(with: self)
   }
    
    func isValid() -> Bool {
        if self.count == 6{
            return true
        }
        else {
            return false
        }
    }
    
    
}
    extension UITextField {
        
   

func isValidValue() -> Bool {
    if self.text?.count != 0 && self.text != nil && !(self.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) {
        return true
    }
    else {
        return false
        
    }
}
//        var isvalidValue : Bool {
//            return self.text?.count != 0 && self.text != nil && !(self.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) != false
//
//            // اعتبر انه انكتب اشي حلو
//                            //غلط حينفي وحيرحع صح
//        }
        
    }
extension UIImageView {
    func setImage(imageUrl : String ){
        self.kf.setImage(with : URL(string : imageUrl))
    }
    
}
