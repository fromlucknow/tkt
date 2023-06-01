//
//  Alert.swift
//  SmartlyLink
//
//  Created by Saif on 18/05/21.
//

import Foundation
import UIKit
class Alert{
    class func showAlert(title:String,msg:String,viewCont:UIViewController,style:UIAlertAction.Style = .default){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: style, handler: nil))
        viewCont.present(alert, animated: true, completion: nil)
    }
}
