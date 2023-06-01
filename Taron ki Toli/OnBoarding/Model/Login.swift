//
//  Login.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 15/04/1944 Saka.
//

import Foundation
// MARK: - Otp
struct Login: Decodable {
    
    let status: Int
    let success:Bool
    let message:String
    let code :Int
    let token: String?
    
}


