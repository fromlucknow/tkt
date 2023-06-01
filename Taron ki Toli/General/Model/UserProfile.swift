//
//  GetUser.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 17/04/1944 Saka.
//


import Foundation

// MARK: - UserProfile
struct UserProfile: Codable {
    let status: Int
    let success: Bool
    let code: Int
    let message: String
    let data: User
}

// MARK: - DataClass
struct User: Codable {
    let id: Int
      let authProvider, parentID: String
      let roleID: Int
      let userUniqueID, ipAddress: String
      let adminID: String?
      let name, firstname: String
      let lastname, username: String?
      let logUsername, email, phone, dob: String
      let gender: String
      let emailVerifiedAt, profilePics: String?
      let status, createdAt, updatedAt: String
      let totalStars: Int
      let avtar: String
  
      enum CodingKeys: String, CodingKey {
          case id
          case authProvider = "auth_provider"
          case parentID = "parent_id"
          case roleID = "role_id"
          case userUniqueID = "user_unique_id"
          case ipAddress = "ip_address"
          case adminID = "admin_id"
          case name, firstname, lastname, username, logUsername, email, phone, dob, gender
          case emailVerifiedAt = "email_verified_at"
          case profilePics = "profile_pics"
          case status
          case createdAt = "created_at"
          case updatedAt = "updated_at"
          case totalStars, avtar
      }
}


//import Foundation
//
//// MARK: - Register
//struct Register: Codable {
//    let status: Int
//    let success: Bool
//    let code: Int
//    let message: String
//    let data: DataClass
//}
//
//// MARK: - DataClass
//struct DataClass: Codable {
//    let id: Int
//    let authProvider, parentID: String
//    let roleID: Int
//    let userUniqueID, ipAddress: String
//    let adminID: String?
//    let name, firstname: String
//    let lastname, username: String?
//    let logUsername, email, phone, dob: String
//    let gender: String
//    let emailVerifiedAt, profilePics: String?
//    let status, createdAt, updatedAt: String
//    let totalStars: Int
//    let avtar: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case authProvider = "auth_provider"
//        case parentID = "parent_id"
//        case roleID = "role_id"
//        case userUniqueID = "user_unique_id"
//        case ipAddress = "ip_address"
//        case adminID = "admin_id"
//        case name, firstname, lastname, username, logUsername, email, phone, dob, gender
//        case emailVerifiedAt = "email_verified_at"
//        case profilePics = "profile_pics"
//        case status
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case totalStars, avtar
//    }
//}
