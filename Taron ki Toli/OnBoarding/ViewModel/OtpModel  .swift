//
//  OtpModel  .swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 14/06/22.
//

import Foundation
protocol OtpDelegate {
    func otpSent(data:Otp)
    func otpSendFailed(message:String)
}
class OtpModel : NSObject {
    
    private var apiService = ApiManager.shared
    fileprivate var otpData : Otp!
    var otpDelegate : OtpDelegate!
    override init() {
        super.init()
        self.apiService = ApiManager.shared
       // callforOtp()
    }
    
    func callforOtp(param: [String:Any]){
        self.apiService.postRequestForParameters( url: bASEURL + OTP_SEND, params: param , model: Otp.self) { (resp, data, isSuccess) in
            
//            let jsonDecoder = JSONDecoder()
//            let empData = try! jsonDecoder.decode(Otp.self, from: data ?? <#default value#>)
            
            if isSuccess{
                
                self.otpDelegate.otpSent(data: (resp as? Otp)!)
                
            }else{
                
                self.otpDelegate.otpSendFailed(message: "")
                
            }
        }
    }
}
