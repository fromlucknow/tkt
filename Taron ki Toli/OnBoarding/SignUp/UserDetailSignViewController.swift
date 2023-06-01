//
//  UserDetailSignViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 21/05/22.
//

import UIKit
public enum gender{
    case male
    case female
    case other
}

class UserDetailSignViewController: UIViewController {
    
    var shiftView : CGFloat = 0
    @IBOutlet weak var phoneTextfield: UITextField!
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var fullNameTextfield: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var otherGenderButton: UIButton!
    private var otpViewModel : OtpModel!
    var gend = gender.male
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackGroundImage()
        self.otpViewModel = OtpModel()
        otpViewModel.otpDelegate = self
        gend = .male
        registerForKeyboardNotification()
        phoneTextfield.delegate =  self
        userNameTextfield.delegate =  self
        fullNameTextfield.delegate =  self
        passwordTextfield.delegate =  self
        setupToHideKeyboardOnTapOnView()
    }
    
    func registerForKeyboardNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
           
                //+ shiftView
            let c = self.view.frame.height - keyboardSize.height - 250
            if shiftView > c{
                self.view.frame.origin.y = -(shiftView - c)
            }else{
                self.view.frame.origin.y = 0
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    // MARK: - SignupAction
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if validate(){
            UserDefaults.standard.set(["fullName":fullNameTextfield.text!,"dob":UserDefaults.standard.string(forKey: "dob")?.replacingOccurrences(of: "/", with: "-") , "mobemail":phoneTextfield.text!,"username":userNameTextfield.text!,"password":passwordTextfield.text!,"type":"student", "gender":String.init(describing: gend) ], forKey: "signUpData")
            otpViewModel.callforOtp(param: ["emailMob":phoneTextfield.text!])
        }
        
    }
 
    @IBAction func maleFemale(_ sender: UIButton) {
        
        sender.setBackgroundImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
        if sender.tag == 1{
            femaleButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            otherGenderButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            gend = .male
        }else if sender.tag == 2{
            maleButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            otherGenderButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            gend = .female
            
        }else{
            femaleButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            maleButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            gend = .other
        }
        
        
    }
    func validate()-> Bool{
        
        if phoneTextfield.text!.isEmpty{
            return false
        }else if userNameTextfield.text!.isEmpty{
            return false
        }else if fullNameTextfield.text!.isEmpty || !fullNameTextfield.text!.contains(" "){
            return false
        }else if passwordTextfield.text!.isEmpty{
            return false
        }else{
            return true
        }
        
    }

}

extension UserDetailSignViewController : OtpDelegate {
    
    func otpSent(data: Otp) {
        print(data.message)
        let vc = storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
        vc.message_id = data.data.message_id
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func otpSendFailed(message: String) {
        print("sdhds")
    }
    
    
}

extension UserDetailSignViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.superview!.frame.origin.y)
        shiftView = textField.superview!.frame.origin.y
    }
    
}
