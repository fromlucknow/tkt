//
//  UserModel.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 11/07/22.
//

import Foundation
protocol UserModelDelegate {
    func gotData(data:UserProfile)
     func gettingDataFailed(message:String)
}
class UserModel : NSObject{
    
    private var apiService = ApiManager.shared
    var delegate : UserModelDelegate!

    override init() {
        super.init()
        self.apiService = ApiManager.shared
       
    }
    
    func getData(param: [String:Any]){
        self.apiService.postRequestForParameters( url: bASEURL + GET_USER, params: param , model: UserProfile.self) { (resp, data, isSuccess) in
            
            
            if isSuccess{
                
                self.delegate.gotData(data: (resp as? UserProfile)!)
                
            }else{
                if let _ = resp as? NSDictionary{
                if let status = (resp as! NSDictionary )["status"] {
                    if status as! String == "Token is Expired"{
                        self.delegate.gettingDataFailed(message: status as! String)
                    }else{
                        self.delegate.gettingDataFailed(message: "Error Network")
                    }
                }
                    
                }else{
                self.delegate.gettingDataFailed(message: "Error Network")
                }
                
            }
        }
    }
}
