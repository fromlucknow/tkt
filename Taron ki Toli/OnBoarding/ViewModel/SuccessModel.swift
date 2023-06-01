//
//  SuccessModel.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 22/06/22.
//

import Foundation

protocol SuccessDelegate {
    func success(data:Success)
    func failed(message:String)
}
class SuccessModel : NSObject{
    
    private var otpMatch : Success!
    private var apiService = ApiManager.shared
    var successDelegate : SuccessDelegate!

    override init() {
        super.init()
        self.apiService = ApiManager.shared
       // callforOtp()
    }
    
    func success(param: [String:Any],url:String){
        self.apiService.postRequestForParameters( url: bASEURL + url, params: param , model: Success.self) { (resp, data, isSuccess) in
            
//            let jsonDecoder = JSONDecoder()
//            let empData = try! jsonDecoder.decode(Otp.self, from: data ?? <#default value#>)
            
            if isSuccess{
                
                self.successDelegate.success(data: (resp as? Success)!)
                
            }else{
                
                self.successDelegate.failed(message: "Error Network")
                
            }
        }
    }
}
