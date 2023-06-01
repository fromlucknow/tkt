//
//  RegisterModel.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 18/06/22.
//

import Foundation
protocol RegisterDelegate {
    func registered(data:Register)
    func registerFailed(message:String)
}
class RegisterModel : NSObject{
    
    private var apiService = ApiManager.shared
    var regDelegate : RegisterDelegate!

    override init() {
        super.init()
        self.apiService = ApiManager.shared
       // callforOtp()
    }
    
    func signUp(param: [String:Any]){
        self.apiService.postRequestForParameters( url: bASEURL + SIGN_UP_URL, params: param , model: Register.self) { (resp, data, isSuccess) in
            

            
            if isSuccess{
                
                self.regDelegate.registered(data: (resp as? Register)!)
                
            }else{
                
                self.regDelegate.registerFailed(message: "Error Network")
                
            }
        }
    }
}

