//
//  ParentViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 15/06/22.
//

import UIKit

class ParentViewController: UIViewController {

    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var otherGenderButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    var gend = gender.male
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackGroundImage()
        gend = .male
        // Do any additional setup after loading the view.
    }
    

    @IBAction func maleFemale(_ sender: UIButton) {
//        if sender.backgroundImage(for: .normal) == UIImage(systemName: "largecircle.fill.circle"){
//
//        }
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
