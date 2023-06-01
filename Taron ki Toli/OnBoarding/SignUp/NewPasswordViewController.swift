//
//  NewPasswordViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 13/04/1944 Saka.
//

import UIKit

class NewPasswordViewController: UIViewController {
    
    
    var shiftView : CGFloat = 0
    
    // MARK: - Life Cycle
    
    @IBOutlet weak var newPassTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotification()
        addBackGroundImage()
        setupToHideKeyboardOnTapOnView()
    }
    
    @IBAction func next(_ sender: Any) {
        if passwordTf.text!.isEmpty{
            Alert.showAlert(title: "Taaron ki Toli", msg: "पासवर्ड ?", viewCont: self)
        }else if newPassTf.text!.isEmpty {
            Alert.showAlert(title: "Taaron ki Toli", msg: "स्थायी पासवर्ड ?", viewCont: self)
        }else{
            self.navigationController?.popToAViewController(ofClass: ViewController.self, animated: true)
        }
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
}
