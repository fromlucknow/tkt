//
//  SignUpViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 19/05/22.
//

import UIKit

class SignUpViewController: UIViewController, DatePickerDelegate {
    
    @IBOutlet weak var userNameTf: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    var dateSelected = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackGroundImage()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func chooseDate(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DateSelectViewController") as! DateSelectViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
        self.view.endEditing(true)
        
    }
    
    func dateSelected(date: Date) {
        
        dateTextField.text = date.formatDatein_DD_MM_YYY()
        dateSelected = date
        self.view.endEditing(true)
        print(date)
        
    }
    
    
    @IBAction func next(_ sender: Any) {
        if validateName() && !dateTextField.text!.isEmpty{
        let c =  Calendar.current.dateComponents([.year], from: dateSelected, to: Date())
            UserDefaults.standard.set(dateTextField.text!, forKey: "dob")
        if c.year! >= 18 {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserDetailSignViewController") as! UserDetailSignViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
            self.present(vc, animated: true, completion: nil)
        }
        self.view.endEditing(true)
        }
        
    }
    
    func validateName() -> Bool{
        
        if userNameTf.text!.isEmpty{
            Alert.showAlert(title: "Taaron ki Toli", msg: "Please enter your name", viewCont: self)
            return false
        }else if !(userNameTf.text?.contains(" "))!{
            Alert.showAlert(title: "Taaron ki Toli", msg: "Please enter your full name", viewCont: self)
            return false
        }
        return true
        
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
public extension UITextField {
    override var textInputMode: UITextInputMode? {
        return UITextInputMode.activeInputModes.filter { $0.primaryLanguage == "hi" }.first ?? super.textInputMode
    }
}
