//
//  Extensions.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 19/05/22.
//
import UIKit
import Foundation




public extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy:".").last!
    }
    
    var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy:".").last!
    }
}

//MARK:- UIViewController
extension UIViewController {
    //backToViewController
    func backToViewController(value: Int) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - value], animated: true)
    }
    
    func getControllerIdentifier() -> String
    {
        return(String(describing: self.title))
    }
    
    func addBackGroundImage(){
        let imageView = UIImageView(frame:CGRect(x:0,y:0,width:self.view.frame.width , height:self.view.frame.height))
        self.view.addSubview(imageView)
        imageView.image = UIImage(named:"flashScreen")
        self.view.sendSubviewToBack(imageView)
    }
    func addKaroBackGroundImage(){
        let imageView = UIImageView(frame:CGRect(x:0,y:0,width:self.view.frame.width , height:self.view.frame.height))
        self.view.addSubview(imageView)
        imageView.image = UIImage(named:"back2")
        self.view.sendSubviewToBack(imageView)
    }
    //This function is used for pop or dismiss a view controller
    func popOrDismissViewController(_animation:Bool = true)
    {
        if let navController = self.navigationController
        {
            navController.popViewController(animated: _animation)
        }
        else
        {
            self.dismiss(animated: _animation, completion: nil)
        }
    }
    
    
    //This function is used for push or present a view controller
    func pushOrPresentViewController(_ viewController: UIViewController, animated: Bool = true)
    {
        
        if let navController = self.navigationController
        {
            navController.pushViewController(viewController, animated: true)
        }
        else
        {
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    func popToRootViewControllerFastFash(animated: Bool = true)
    {
        if let navController = self.navigationController
        {
            navController.popToRootViewController(animated: true)
        }
    }
    
    func add(_ child: UIViewController,refView:UIView) {
        addChild(child)
        refView.addSubview(child.view)
        child.view.frame = refView.bounds
        child.didMove(toParent: self)
    }
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    func removeAllChild()
    {
        guard parent != nil else {
            return
        }
        
        for vc in children
        {
            vc.willMove(toParent: nil)
            vc.removeFromParent()
            vc.view.removeFromSuperview()
        }
        
    }
//    func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
//        let session = URLSession.shared
//        let url = URL(string: Defaults.value(forKey: "profileImageUrl") as! String)
//
//        let dataTask = session.dataTask(with: url!) { (data, response, error) in
//            if error != nil {
//                print("Error fetching the image! 😢")
//                completionHandler(nil)
//            } else {
//                completionHandler(data)
//            }
//        }
//
//        dataTask.resume()
//    }
    func setImage(from url: String,completionHandler: @escaping (_ data: Data?) -> ()) {
        if let imageURL = URL(string: url) {

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageURL)   {

            return completionHandler(imageData)
        }
            else{
               completionHandler(nil)
            }
    }
        }
        else{
           completionHandler(nil)
        }
}
    
   func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    

    
}
extension UIApplication {
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        return viewController
    }
}
extension String{
    func emailValidation() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
//MARK:- Extension of UIColor
extension UIColor
{
    // Function helps to generate colour using hex
    class func hexStringToUIColor (hex:String) -> UIColor
    {
        return (.hexStringToUIColorWithAlpha (hex:hex,alpha:1.0))
    }
    
    // Function helps to generate colour using hex with alpha
    static func hexStringToUIColorWithAlpha (hex:String,alpha:CGFloat) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

extension UITableView{
    
    func fastFashTableViewSetup(cellArrayToRegister:[String])
    {
        self.delegate = self as? UITableViewDelegate
        self.dataSource = self as? UITableViewDataSource
        self.estimatedRowHeight = 140
        self.rowHeight = UITableView.automaticDimension
        _ = cellArrayToRegister.map {
            self.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
    }
    
    
    func tableViewSetupWithViewC(ViewController: UIViewController, cellArrayToRegister:[String])
    {
        self.delegate = ViewController as? UITableViewDelegate
        self.dataSource = ViewController as? UITableViewDataSource
        self.estimatedRowHeight = 50
        self.rowHeight = UITableView.automaticDimension
        _ = cellArrayToRegister.map {
            self.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
    }
    
    func scrollToBottom(){
        if  self.numberOfRows(inSection:  self.numberOfSections - 1) > 0{
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections - 1) - 1,
                section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    }
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }

    
    func scrollToTop() {
    
        DispatchQueue.main.async
        {
            let indexPath = IndexPath(row: 0, section: 0)
            
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.scrollToRow(at: indexPath, at: .top, animated: false)
            }
           // self.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    
    func reloadRowsFastFash(indexPathSet:[IndexPath])
    {
        UIView.performWithoutAnimation
            {
                self.reloadRows(at: indexPathSet, with: .none)
                self.layoutIfNeeded()
        }
    }
    func reloadFastFashTable()
    {
        UIView.performWithoutAnimation
        {
            self.reloadData()
            self.layoutIfNeeded()
//            self.endUpdates()
        }
    }
    func reloadSectionFastFash(index:Int)
    {
        UIView.performWithoutAnimation
            {
                let sectionIndex = IndexSet(integer: index)
                self.reloadSections(sectionIndex, with: .none)
                self.layoutIfNeeded()
        }
    }
}

extension UITableViewCell
{
    class func getCellIdentifier() -> String
    {
        return String(describing : self)
    }
}

extension UICollectionViewCell
{
    class func getCellIdentifier() -> String
    {
        return String(describing : self)
    }
}

extension NSMutableArray
{
    func addExtraObject(_ key : String, value : String)
    {
        for index in 0..<self.count
        {
            let tempDict = NSMutableDictionary()
            tempDict.addEntries(from: self.object(at: index) as! NSDictionary as! [AnyHashable: Any])
            tempDict.setObject(value, forKey: key as NSCopying)
            self.replaceObject(at: index, with: tempDict)
        }
    }
}

extension UINavigationController {
    
    func popToAViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
            popToViewController(vc, animated: animated)
        }
    }
    
    func popViewControllers(viewsToPop: Int, animated: Bool = true) {
        if viewControllers.count > viewsToPop {
            let vc = viewControllers[viewControllers.count - viewsToPop - 1]
            popToViewController(vc, animated: animated)
        }
    }
    
}

extension UICollectionView
{
    func fastFashCollectionViewSetup(cellArrayToRegister:[String])
    {
        self.delegate = self as? UICollectionViewDelegate
        self.dataSource = self as? UICollectionViewDataSource
        _ = cellArrayToRegister.map {
            self.register(UINib(nibName: $0, bundle: nil), forCellWithReuseIdentifier: $0)
        }
    }
    
    func collectionViewSetupWithViewC(ViewController: UIViewController, cellArrayToRegister:[String])
    {
        self.delegate = ViewController as? UICollectionViewDelegate
        self.dataSource = ViewController as? UICollectionViewDataSource
        _ = cellArrayToRegister.map {
            self.register(UINib(nibName: $0, bundle: nil), forCellWithReuseIdentifier: $0)
        }
    }
}

extension Date {
    
    /// Returns a Date with the specified amount of components added to the one it is called with
    func add(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        let components = DateComponents(year: years, month: months, day: days, hour: hours, minute: minutes, second: seconds)
        return Calendar.current.date(byAdding: components, to: self)
    }
    
    /// Returns a Date with the specified amount of components subtracted from the one it is called with
    func subtract(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        return add(years: -years, months: -months, days: -days, hours: -hours, minutes: -minutes, seconds: -seconds)
    }
    
    func formatDatein_DD_MM_YYY() -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
       return formatter.string(from: self)
        
    }
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

extension UITextField {
    
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }
    
    func addPadding(_ padding: PaddingSide) {
        
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        switch padding {
            
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}

//extension UIView{
//
//    @IBInspectable var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//            layer.masksToBounds = newValue > 0
//        }
//    }
//
//    @IBInspectable var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        set {
//            layer.borderWidth = newValue
//        }
//    }
//
//    @IBInspectable var borderColor: UIColor? {
//        get {
//            return UIColor(cgColor: layer.borderColor!)
//        }
//        set {
//            layer.borderColor = newValue?.cgColor
//        }
//    }
//}

//extension UIView {
//    @IBInspectable var shadowColor: UIColor?{
//        set {
//            guard let uiColor = newValue else { return }
//            layer.shadowColor = uiColor.cgColor
//        }
//        get{
//            guard let color = layer.shadowColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//
//    @IBInspectable var shadowOpacity: Float{
//        set {
//            layer.shadowOpacity = newValue
//        }
//        get{
//            return layer.shadowOpacity
//        }
//    }
//
//    @IBInspectable var shadowOffset: CGSize{
//        set {
//            layer.shadowOffset = newValue
//        }
//        get{
//            return layer.shadowOffset
//        }
//    }
//
//    @IBInspectable var shadowRadius: CGFloat{
//        set {
//            layer.shadowRadius = newValue
//        }
//        get{
//            return layer.shadowRadius
//        }
//    }
//}

extension UIView {
    
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
    
    func addBorderShadow(cornerRadius:CGFloat,borderWidth:CGFloat, offSetWidth:Double, offSetHeight:Double)
    {
        //view shadow
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor.hexStringToUIColor(hex: "999999").cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: offSetWidth, height: offSetHeight)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3.0
        
    }
    
    func roundTopCorners(radius: CGFloat) {
            DispatchQueue.main.async {
                let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: radius, height: radius))
                let mask = CAShapeLayer()
                mask.path = path.cgPath
                self.layer.mask = mask
            }
        }
    func roundBottomCorners(radius: CGFloat) {
               DispatchQueue.main.async {
                   let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: radius, height: radius))
                   let mask = CAShapeLayer()
                   mask.path = path.cgPath
                   self.layer.mask = mask
               }
           }
        func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            DispatchQueue.main.async {
                let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
                let mask = CAShapeLayer()
                mask.path = path.cgPath
                self.layer.mask = mask
            }
        }
    
    // MARK: - To make shadow at bottom view
    
    func borderShadow()
    {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 1.0
        self.layer.shadowPath = UIBezierPath(rect:CGRect(x: 0, y: self.frame.height, width: UIScreen.main.bounds.size.width, height: 2)).cgPath
    }
    
    func  addGesture(){
        var tapGesture = UITapGestureRecognizer()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    func removeGesture()
    {
        if self.gestureRecognizers != nil
        {
            for gesture in self.gestureRecognizers! where gesture is UITapGestureRecognizer
            {
                self.removeGestureRecognizer(gesture)
            }
        }
    }
    
    /// Hide keyboard when user taps anywhere on the screen.
    @objc func hideKeyboard()
    {
        self.endEditing(true)
    }
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
                let border = CALayer()
        border.backgroundColor = color
                switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
    
    func dropShadowAccordingly(color:UIColor,width: CGFloat,height:CGFloat,rad:CGFloat) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowRadius = rad
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale =  UIScreen.main.scale
    }
}

class TextEdit{
    static var shared = TextEdit()
    private init(){
        
    }
    
    func singleTextWithDifferentFonts(strings:[String],fonts:[UIFont]){
        let attributedString = NSMutableAttributedString()
        for i in 0...strings.count{
            let text = strings[i]
                       let attrs = [NSAttributedString.Key.font : fonts[i]]
                      let attributedtext = NSMutableAttributedString(string:text, attributes:attrs)
            attributedString.append(attributedtext)
        }
    }
}

extension UINavigationController {
    func popViewControllerWithHandler(handler: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(handler)
        self.popViewController(animated: true)
        CATransaction.commit()
    }
}
