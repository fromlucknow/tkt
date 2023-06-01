//
//  CommonTextfield.swift
//  SmartlyLink
//
//  Created by Saif on 17/05/21.
//

import UIKit


@IBDesignable class CommonTextfield: UITextField {
    var erButt : UIButton?
    var imageView = UIImageView()
    @IBInspectable var leftPadding : CGFloat = 52
    {
        didSet{
            let view = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 20))
            leftView = view
            leftViewMode = .always
           
        }
    }
 
    
    @IBInspectable var hasEye: Bool = false{
        didSet{
            self.clearsOnBeginEditing = false
            rightViewMode = .always
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            imageView.image = UIImage(systemName: "eye.fill")
            imageView.tintColor = #colorLiteral(red: 0, green: 0.462745098, blue: 0.6705882353, alpha: 1)
            var width =   30
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line
            {
                width = width+5
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            rightView = view
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(eyeTapped(_:))))
        }
    }
    @objc func eyeTapped(_ sender: UITapGestureRecognizer){
        isSecureTextEntry = !isSecureTextEntry
        self.clearsOnBeginEditing = false
        imageView.tintColor = isSecureTextEntry ? #colorLiteral(red: 0, green: 0.462745098, blue: 0.6705882353, alpha: 1) : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: self.frame.size.height)
      //  self.layer.borderWidth = borderWidth
       // self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = 25
        self.font = UIFont(name: "CircularStd-Book", size: 12)
      //  self.backgroundColor = UIColor.hexStringToUIColor(hex: "#F5F8FF")
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "" , attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2274509804, alpha: 1)])
       // erButt = UIButton(frame: CGRect(x: self.frame.width - 64   , y: 16, width: 32, height: 32))
       //  erButt?.setBackgroundImage(UIImage.init(systemName: "exclamationmark.circle"), for: .normal)
       //  erButt?.tintColor = .red
       //  self.addSubview(erButt!)
       //  self.bringSubviewToFront(erButt!)
    }
    
        


}


