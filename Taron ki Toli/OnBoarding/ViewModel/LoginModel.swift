//
//  LoginModel.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 15/04/1944 Saka.
//

import Foundation
protocol LoginDelegate {
    func login(data:Login)
    func loginFailed(message:String)
}
class LoginModel : NSObject{
    
    private var apiService = ApiManager.shared
    var loginDelegate : LoginDelegate!

    override init() {
        super.init()
        self.apiService = ApiManager.shared
       // callforOtp()
    }
    
    func signUp(param: [String:Any]){
        self.apiService.postRequestForParameters( url: bASEURL + LOGINURL, params: param , model: Login.self) { (resp, data, isSuccess) in
            
            
            if isSuccess{
                
                self.loginDelegate.login(data: (resp as? Login)!)
                
            }else{
                
                self.loginDelegate.loginFailed(message: "Error Network")
                
            }
        }
    }
}

