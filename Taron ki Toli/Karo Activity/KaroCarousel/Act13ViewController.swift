//
//  Act13ViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 26/07/22.
//

import UIKit

class Act13ViewController: UIViewController {

    
    @IBOutlet weak var transButton3: UIButton!
    @IBOutlet weak var transpButton2: UIButton!
    @IBOutlet weak var transpButton1: UIButton!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var view2: DesignableView!
    @IBOutlet weak var view1: DesignableView!
    @IBOutlet weak var view3: DesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
      
    }
    

    @IBAction func home(_ sender: Any) {
        self.navigationController?.popToAViewController(ofClass: KaroViewController.self, animated: true)

    }
    
    @IBAction func next(_ sender: Any) {
    }
    
    @IBAction func select1(_ sender: Any) {
        view1.alpha = 1
           
        view2.alpha = 0.5
            
        view3.alpha = 0.5
        
    }
    
    @IBAction func select2(_ sender: Any) {
        
    }
    
    
    @IBAction func select3(_ sender: Any) {
        
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
