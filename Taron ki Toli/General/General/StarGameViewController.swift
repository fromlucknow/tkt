//
//  StarGameViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 13/06/22.
//

import UIKit

class StarGameViewController: UIViewController {
    @IBOutlet var abc: [UIButton]!
    
    @IBOutlet weak var infoLabel: UILabel!
    var count = 0
    @IBOutlet weak var clock: UIImageView!
    @IBOutlet weak var clockTimeLabel: UILabel!
    @IBOutlet weak var countingView: UIView!
    var timeCount = 0
    @IBOutlet var starViews: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starViews.frame = CGRect(x: 0, y: -3400, width: self.view.frame.width, height: 3400)
        self.view.addSubview(starViews)
        self.view.bringSubviewToFront(clock)
        self.view.bringSubviewToFront(infoLabel)
        self.view.bringSubviewToFront(countingView)
        self.view.bringSubviewToFront(clockTimeLabel)
        starViews.isUserInteractionEnabled = true
        
        for i in abc{
            count = count + 1
            i.isUserInteractionEnabled = true
            i.tag = count
            
            let gest = UITapGestureRecognizer(target: self, action: #selector(click(_:)))
            gest.view?.tag = count
            i.addGestureRecognizer(gest)
        }
        count = 0
        anime()
        timeStart()
    }
    
   func timeStart(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.timeCount += 1
            if self.timeCount == 2 {
            self.infoLabel.isHidden = true
            }
                if self.timeCount != 60{
                    self.clockTimeLabel.text = "0:\(self.timeCount)"
                    self.timeStart()
                }else{
                    self.clockTimeLabel.text = "1:00"
                    DispatchQueue.main.async {

                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ClockViewController") as! ClockViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
        }
        
    }
    
    @IBAction func abcd(_ sender: UIButton) {
        sender.isHidden = true
        print("clicked item")
    }
    
    @objc func click(_ sender: UITapGestureRecognizer){
        if sender.view!.tag != 0{
        abc[sender.view!.tag].isHidden = true
        }
        print(sender.view!.tag)
        print("clicked item")
    }
    
//        UIView.animate(withDuration: 10) {
//            self.starViews.transform = CGAffineTransform(translationX: 0, y: 3400)
//        }
       

//        UIView.animate(withDuration: 10) {
//            self.starViews.transform = CGAffineTransform(translationX: 0, y: -3400)
//        } completion: { (true) in
//            self.starViews.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
//            UIView.animate(withDuration: 10) {
//                self.starViews.transform = CGAffineTransform(translationX: 0, y: -3400)
//            } completion: { (true) in
        
        //        print("abc")
          //  }

       // }

    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("but found")
//        guard let touch = (touches as NSSet).anyObject() as? UITouch else {
//                  return
//              }
//        for i in abc{
//            let touchLocation = touch.location(in: self.view)
//            if i.layer.presentation()?.hitTest(touchLocation) != nil{
//                print("got it")
//            }
//            i.layer.presentationLayer()?.hitTest(touchLocation) != nil do {
//                        self.buttonPressed(button)
//                    }
      //  }
        //print("but found")
  //  }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        guard let touch = (touches as NSSet).anyObject() as? UITouch else {
//            return
//        }
//
//        guard let button = self.view.viewWithTag(100) as? UIButton else {
//            return
//        }
//
//        let touchLocation = touch.locationInView(self.view)
//        if button.layer.presentationLayer()?.hitTest(touchLocation) != nil {
//            self.buttonPressed(button)
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func anime(){
        
//        UIView.animate(withDuration: 30, delay: 0, options: [.curveLinear]) {
//          //  self.starViews.transform = CGAffineTransform(translationX: 0, y: 0)
//            self.starViews.frame = CGRect(x: 0, y: 2500, width: self.view.frame.width, height: 3400)
//        } completion: { (true) in
//            self.anime()
//        }

//        UIView.transition(with: starViews, duration: 10, options: .transitionFlipFromTop) {
//            self.starViews.frame = CGRect(x: 0, y: 2500, width: self.view.frame.width, height: 3400)
//        } completion: { (true) in
//
//        }

        self.count += 20
        UIView.animate(withDuration: 20, delay: 0, options: [.allowUserInteraction,.curveLinear]) {
            self.starViews.transform = CGAffineTransform(translationX: 0, y: 3400 + self.view.frame.height)
        } completion: { (true) in
            if self.count != 60{
            self.starViews.transform = CGAffineTransform(translationX: 0, y: 0)
            self.anime()
          
            }else{
//                DispatchQueue.main.async {
//
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ClockViewController") as! ClockViewController
//                self.navigationController?.pushViewController(vc, animated: true)
//                }
            }
           
        }
    }
}
