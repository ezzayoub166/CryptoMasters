//
//  Route.swift
//  Test2
//
//  Created by ezz on 15/05/2022.
//

import Foundation
import UIKit
enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    case fetchAllCategories
    case temp
    case palaceOrder(String)
    case Posts
    
    var description : String {
        switch self {
        case .temp : return "/dishes/cat1"
        case .fetchAllCategories : return "/dish-categories"
        case .palaceOrder(let dishId) :   return "/orders/\(dishId)"
        case .Posts : return "https://satco.vip/crypto/api/v1/posts"
        }
    }
    
    
    
    
    
    
}
