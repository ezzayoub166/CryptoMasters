//
//  Post.swift
//  CryptoMasters
//
//  Created by ezz on 07/06/2022.
//

import Foundation

struct PostResponse : Codable {
    let code : Int
    let message : String?
    let status : String?
    let data : [data]?
}

struct data : Codable  {
    var title : String?
    var content : String?
    
}
