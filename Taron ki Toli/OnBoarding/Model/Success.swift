//
//  Success.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 22/06/22.
//

import Foundation

struct Success: Decodable {
    
    let status: Int
    let success:Bool
    let message:String
    let data: SuccessData
    
}

// MARK: - OtpData
struct SuccessData: Decodable {
    
 
    
}
