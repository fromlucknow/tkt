
//
//  Register.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 18/06/22.
//

import Foundation

struct Register: Decodable {
    
    let status: Int
    let success:Bool
    let message:String
    let data: RegisterData
    let token: String
    
}

// MARK: - OtpData
struct RegisterData: Decodable {
    
    let id: Int
       let name, userUniqueID: String

       enum CodingKeys: String, CodingKey {
           case id, name
           case userUniqueID = "user_unique_id"
       }
    
}
