//
//  EnterUsernameViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 14/04/1944 Saka.
//

import UIKit

class EnterUsernameViewController: UIViewController {
    @IBOutlet weak var usernmaeTf: UITextField!
    var type : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackGroundImage()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        if !usernmaeTf.text!.isEmpty{
            let vc = storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
            vc.type = type!
            self.navigationController?.pushViewController(vc, animated: true)
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
