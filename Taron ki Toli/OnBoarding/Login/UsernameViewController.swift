//
//  UsernameViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 14/04/1944 Saka.
//

import UIKit

class UsernameViewController: UIViewController {
    @IBOutlet weak var newTf: UITextField!
    
    @IBOutlet weak var oldTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackGroundImage()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        if oldTf.text!.isEmpty{
            Alert.showAlert(title: "Taaron ki Toli", msg: "पुराना यूजर नाम ?", viewCont: self)
        }else if newTf.text!.isEmpty {
            Alert.showAlert(title: "Taaron ki Toli", msg: "नया यूजर नाम ?", viewCont: self)
        }else{
            self.navigationController?.popToAViewController(ofClass: ViewController.self, animated: true)
        }
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
