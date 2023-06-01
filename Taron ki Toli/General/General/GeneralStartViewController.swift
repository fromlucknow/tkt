//
//  GeneralStartViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 13/06/22.
//

import UIKit

class GeneralStartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3) {
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "StarGameViewController") as! StarGameViewController
            self.navigationController?.pushViewController(viewController, animated: true)
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
