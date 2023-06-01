//
//  OtpMatch.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 18/06/22.
//

import Foundation
// MARK: - Otp
struct OtpMatch: Decodable {
    
    let status: Int
    let success:Bool
    let message:String
    let data: DataOtpMatch
    
}

// MARK: - OtpData
struct DataOtpMatch: Decodable {
    
 
    
}
