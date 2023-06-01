//
//  AllAvatarsModel.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 20/06/22.
//

import Foundation

protocol AllAvatarsDelegate {
    func avatarsFound(data:AllAvatars)
    func ravatarFoundFailed(message:String)
}
class AllAvatarsModel : NSObject{
    
    private var otpMatch : AllAvatars!
    private var apiService = ApiManager.shared
    var delegate : AllAvatarsDelegate!

    override init() {
        super.init()
        self.apiService = ApiManager.shared
       // callforOtp()
    }
    
    func getAvatars(){
        self.apiService.getRequestWithHeader( url: bASEURL + GET_AVATARS , model: AllAvatars.self) { (resp, data, isSuccess) in
            
//            let jsonDecoder = JSONDecoder()
//            let empData = try! jsonDecoder.decode(Otp.self, from: data ?? <#default value#>)
            
            if isSuccess{
                
                self.delegate.avatarsFound(data: (resp as? AllAvatars)!)
                
            }else{
                
                self.delegate.ravatarFoundFailed(message: "Error Network")
                
            }
        }
    }
}

