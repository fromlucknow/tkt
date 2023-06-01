//
//  OTPViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 18/06/22.
//

import UIKit

class OTPViewController: UIViewController,OtpMatchDelegate,RegisterDelegate {

    @IBOutlet weak var otpTextField: UITextField!
    var message_id : String!
    private var otpModel : OtpMatchModel!
    private var registerModel :RegisterModel!
    var type : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackGroundImage()
        otpModel = OtpMatchModel()
        otpModel.otpMatchDelegate = self
        registerModel = RegisterModel()
        registerModel.regDelegate = self
    }
    

    @IBAction func matchOtp(_ sender: Any) {
        
        if !otpTextField.text!.isEmpty{
            if type == "password"{
            let vc = storyboard?.instantiateViewController(withIdentifier: "NewPasswordViewController") as! NewPasswordViewController
            self.navigationController?.pushViewController(vc, animated: true)
            }else if type == "userName"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "UsernameViewController") as! UsernameViewController
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else{

            otpModel.matchforOtp(param: ["message_id" : message_id, "otp":otpTextField.text!])
            }
        }
        
    }
    
    func otpMatch(data: OtpMatch) {
        
        if data.status == 1{
            registerModel.signUp(param: UserDefaults.standard.dictionary(forKey: "signUpData")!)
        }
        
    }
    func otpMatchFailed(message: String) {
        
    }
    
    func registered(data: Register) {
        if data.status == 1{
            
            UserDefaults.standard.setValue(["token":data.token, "user_id":data.data.id,"name":data.data.name,"uniqueId":data.data.userUniqueID], forKey: "ProfileData")
            let vc = self.storyboard!.instantiateViewController(withIdentifier:"AcceptViewController") as! AcceptViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func registerFailed(message: String) {
        Alert.showAlert(title: "TKT", msg: message, viewCont: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
