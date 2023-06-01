//
//  OtpMatchModel.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 18/06/22.
//

import Foundation
protocol OtpMatchDelegate {
    func otpMatch(data:OtpMatch)
    func otpMatchFailed(message:String)
}
class OtpMatchModel : NSObject{
    
    private var otpMatch : OtpMatch!
    private var apiService = ApiManager.shared
    var otpMatchDelegate : OtpMatchDelegate!

    override init() {
        super.init()
        self.apiService = ApiManager.shared
       // callforOtp()
    }
    
    func matchforOtp(param: [String:Any]){
        self.apiService.postRequestForParameters( url: bASEURL + OTP_MATCH, params: param , model: OtpMatch.self) { (resp, data, isSuccess) in
            
//            let jsonDecoder = JSONDecoder()
//            let empData = try! jsonDecoder.decode(Otp.self, from: data ?? <#default value#>)
            
            if isSuccess{
                
                self.otpMatchDelegate.otpMatch(data: (resp as? OtpMatch)!)
                
            }else{
                
                self.otpMatchDelegate.otpMatchFailed(message: "Error Network")
                
            }
        }
    }
}
