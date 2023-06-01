//
//  Karo1ViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 18/07/22.
//

import UIKit

class Karo1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addKaroBackGroundImage()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3) {
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SamajhBadhanaViewController") as! SamajhBadhanaViewControlle1
            viewController.karoActivityNumber = 2
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        // Do any additional setup after loading the view.
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
