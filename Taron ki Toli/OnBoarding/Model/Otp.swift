//
//  Otp.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 14/06/22.
//

import Foundation
// MARK: - Otp
struct Otp: Decodable {
    
    let status: Int
    let success:Bool
    let message:String
    let data: DataOtp
    
}

// MARK: - OtpData
struct DataOtp: Decodable {
    
    let  message_id, id: String?
    let email , phone :String?
    enum CodingKeys: String, CodingKey {
        
        case id
        case phone
        case message_id
        case email
    }
    
}
