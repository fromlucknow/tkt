//
//  GyanBoxViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 19/07/22.
//

import UIKit

class GyanBoxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var descriptionLabel: UILabel!
    

    @IBOutlet weak var imageBottom: UIImageView!
    @IBAction func next(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Activity1ViewController") as! Activity1ViewController
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
