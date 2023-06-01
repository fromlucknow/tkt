//
//  UserAvatarModel.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 11/07/22.
//

import Foundation

import Foundation
protocol AvatarModelDelegate {
    func gotData(data:AvatarByUser)
     func gettingDataFailed(message:String)
}
class UserAvatarModel : NSObject{
    
    private var apiService = ApiManager.shared
    var delegate : AvatarModelDelegate!

    override init() {
        super.init()
        self.apiService = ApiManager.shared
       
    }
    
    func getData(param: [String:Any]){
        self.apiService.postRequestForParameters( url: bASEURL + AVATAR_BY_USER, params: param , model: AvatarByUser.self) { (resp, data, isSuccess) in
            
            
            if isSuccess{
                
                self.delegate.gotData(data: (resp as? AvatarByUser)!)
                
            }else{
                if let status = (resp as! NSDictionary )["status"] {
                    if status as! String == "Token is Expired"{
                        self.delegate.gettingDataFailed(message: status as! String)
                    }else{
                        self.delegate.gettingDataFailed(message: "Error Network")
                    }
                }else{
                self.delegate.gettingDataFailed(message: "Error Network")
                }
                
            }
        }
    }
}
