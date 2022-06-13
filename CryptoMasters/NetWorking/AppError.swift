//
//  AppError.swift
//  Test2
//
//  Created by ezz on 15/05/2022.
//

import Foundation
enum AppError : LocalizedError {
    case errorDecoding
    case unknowErorr
    case invalideUrl
    case serverErorr(String)
    
    var errorDescription: String?{
        switch self {
            
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknowErorr:
            return "Bruhhh!!! I have no idea what go on "
        case .invalideUrl:
            return "HEYYY!!! Give me a vaild URL"
        case .serverErorr(let erorr):
            return erorr
        }
    }
    
}
