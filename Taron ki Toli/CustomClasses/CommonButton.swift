//
//  CommonButton.swift
//  SmartlyLink
//
//  Created by Saif on 12/05/21.
//


import UIKit
@IBDesignable class CommonButton: UIButton {
@IBInspectable var borderWidth:CGFloat = 2.0{
    didSet{
        self.layer.borderWidth = borderWidth
    }
}
@IBInspectable var borderColor:UIColor = UIColor(red: 0, green: 118, blue: 171, alpha: 1.0){
    didSet{
        
        self.layer.borderColor = borderColor.cgColor
    }
}
    @IBInspectable var cornerRadius:CGFloat = 0.0{
    didSet{
        self.layer.cornerRadius = cornerRadius
        
    }
}
    @IBInspectable var sizeFont:CGFloat = 14.0{
        didSet{
            self.titleLabel?.font = UIFont(name: "CircularStd-Book", size: sizeFont)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = UIFont(name: "CircularStd-Book", size: sizeFont)

    }
@IBInspectable
var shadowRadius: CGFloat {
    get {
        return layer.shadowRadius
    }
    set {
        layer.shadowRadius = newValue
    }
}

@IBInspectable
var shadowOpacity: Float {
    get {
        return layer.shadowOpacity
    }
    set {
        layer.shadowOpacity = newValue
    }
}

@IBInspectable
var shadowOffset: CGSize {
    get {
        return layer.shadowOffset
    }
    set {
        layer.shadowOffset = newValue
    }
}

@IBInspectable
var shadowColor: UIColor? {
    get {
        if let color = layer.shadowColor {
            return UIColor(cgColor: color)
        }
        return nil
    }
    set {
        if let color = newValue {
            layer.shadowColor = color.cgColor
        } else {
            layer.shadowColor = nil
        }
    }
}

}
