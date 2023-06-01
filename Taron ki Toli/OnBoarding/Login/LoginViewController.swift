//
//  LoginViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 14/04/1944 Saka.
//

import UIKit

class LoginViewController: UIViewController {
 

    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var emailOrMobileTf: UITextField!
    
    var service : LoginModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackGroundImage()
        service = LoginModel()
        service?.loginDelegate = self

    }
    
    @IBAction func login(_ sender: Any) {
        
        if emailOrMobileTf.text!.isEmpty{
            Alert.showAlert(title: "TKT", msg: "ईमेल / मोबाईल नंबर / यूजर नाम ?", viewCont: self)
        }else if passwordTf.text!.isEmpty{
            Alert.showAlert(title: "TKT", msg: "पासवर्ड ?", viewCont: self)
        }else{
            service?.signUp(param: ["email":emailOrMobileTf.text! , "password":passwordTf.text!])
        }
        
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "EnterUsernameViewController") as! EnterUsernameViewController
        vc.type = "password"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func usernameReset(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EnterUsernameViewController") as! EnterUsernameViewController
        vc.type = "userName"
        self.navigationController?.pushViewController(vc, animated: true)
        
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
extension LoginViewController:LoginDelegate{
    func login(data: Login) {
        if data.status == 1{
            UserDefaults.standard.setValue(["token":data.token!, "user_id":0,"name":"","uniqueId":""], forKey: "ProfileData")
            let storybd = UIStoryboard(name: "Dashboard", bundle: nil)
            let vc = storybd.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            Alert.showAlert(title: "TKT", msg: data.message, viewCont: self)
        }
    }
    
    func loginFailed(message: String) {
        Alert.showAlert(title: "TKT", msg: message, viewCont: self)
    }
    
}
