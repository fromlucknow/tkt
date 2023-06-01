//
//  AllAvatars.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 20/06/22.
//

import Foundation
struct AllAvatars: Decodable {
    
    let status: Int
    let success:Bool
    let message:String
    let data: [Avatars]
    
}

// MARK: - OtpData
struct Avatars: Decodable {
    
    let avtar: String
    let  id:Int
    enum CodingKeys: String, CodingKey {
        
        case id
        case avtar
        
    }
    
}
