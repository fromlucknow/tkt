//
//  TopHeader.swift
//  TextToVoiceApp
//
//  Created By Saifur Rahman MAC 2 on 21/03/20.
//  Copyright © 2020 System Administrator. All rights reserved.
//

//
//  HeaderViews.swift
//  TextToVoiceApp
//
//  Created By Saifur Rahman MAC 2 on 21/03/20.
//  Copyright © 2020 System Administrator. All rights reserved.
//

import UIKit

class TopHeader: UIView {
    let nibName = "TopHeader"
    var contentView:UIView?
    @IBOutlet weak var backButtonWidth: NSLayoutConstraint!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet var headerView: UIView!
    
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabelTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBAction func menuTap(_ sender: Any) {
    }
   
//    @IBAction func logoutNow(_ sender: Any) {
//          let alert = UIAlertController(title: "SosudaPay", message: "Do you want to logout?", preferredStyle: UIAlertController.Style.alert)
//                        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
//                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
//
//                            Defaults.set(nil, forKey: "UserDictionary")
//                            Defaults.set(nil, forKey: "PassCode")
//                  // AppDelegate.index = nil
//                          //  GotoThreadVC.wantToGoBack = false
//                            let pLoginViewController1 = self.findViewController()?.storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
//                            self.findViewController()?.navigationController!.pushViewController(pLoginViewController1!, animated: true)
//
//
//                        }))
//
//
//        self.findViewController()?.present(alert, animated: true, completion: nil)
//
//    }
    
//    func navigateNow(){
////           Alert.deletesavedChat()
////           Alert.deleteMessages()
//        let pLoginViewController1 = self.findViewController()?.storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
//        self.findViewController()?.navigationController!.pushViewController(pLoginViewController1!, animated: true)
//
//       }
    
//    func goBacknow(){
//        self.findViewController()?.navigationController?.popViewController(animated: true)
//    }
//    @IBAction func tapping(_ sender: Any) {
//        //
//        print("going back")
//        goBacknow()
//       // self.inputViewController?.navigationController?.popViewController(animated: true)
//    }
    //    @IBAction func buttonTap(_ sender: UIButton) {
//        self.viewContainingController()?.navigationController?.popViewController(animated: true)
//    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
      //  c?.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           headerView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(headerView)
        self.backgroundColor = .clear
      //  backButton.addTarget(self, action: #selector(tapping(_:)), for: .touchUpInside)
//        contentViews.frame = self.bounds
//        contentViews.autoresizingMask =  [.flexibleWidth,.flexibleHeight]
//      guard let view = loadViewFromNib() else { return }
//              view.frame = self.bounds
//              self.addSubview(view)
//              contentView = view
      
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        // we need to adjust the frame of the subview to no longer match the size used
        // in the XIB file BUT the actual frame we got assinged from the superview
        self.headerView.frame = self.bounds
    }
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
               let nib = UINib(nibName: nibName, bundle: bundle)
               return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}


