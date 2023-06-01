//
//  AvatarByUser.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 11/07/22.
//

import Foundation
struct AvatarByUser: Decodable {
    
    let status: Int
    let success:Bool
    let message:String
    let data: AvatarData
   
    
}

// MARK: - OtpData
struct AvatarData: Decodable {
    
    let id: Int
       let avtar: String

    enum CodingKeys: String, CodingKey {
           case avtar
        case id
       }
    
}
