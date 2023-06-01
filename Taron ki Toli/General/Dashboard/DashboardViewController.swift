//
//  DashboardViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 15/04/1944 Saka.
//

import UIKit

class DashboardViewController: UIViewController {

    private var sideMenuViewController: SideMenuViewController!
    private var sideMenuShadowView: UIView!
    private var sideMenuRevealWidth: CGFloat = 260
    private let paddingForRotation: CGFloat = 150
    private var isExpanded: Bool = false
    private var draggingIsEnabled: Bool = false
    private var panBaseLocation: CGFloat = 0.0
    var selectedIndex = 0
    // Expand/Collapse the side menu by changing trailing's constant
    private var sideMenuTrailingConstraint: NSLayoutConstraint!

    private var revealSideMenuOnTop: Bool = true
    
    var gestureEnabled: Bool = true
    let collectionData = [("MAIN",#imageLiteral(resourceName: "star")),("CART",#imageLiteral(resourceName: "question")),("PROFILE",#imageLiteral(resourceName: "setting"))]

   
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var starCountLabel: UILabel!
    private var userProfile : UserModel!
    private var userAvatar : UserAvatarModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackGroundImage()
        userProfile = UserModel()
        userProfile.delegate = self
        userAvatar = UserAvatarModel()
        userAvatar.delegate = self
        
        let data = UserDefaults.standard.dictionary(forKey: "ProfileData")
        getData(token: data!["token"] as! String)
        print(data!["token"] as! String)
        sideMenuSetting()
    }
    
    // MARK: - side menu setting
    func sideMenuSetting(){
        self.sideMenuShadowView = UIView(frame: self.view.bounds)
        self.sideMenuShadowView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.sideMenuShadowView.backgroundColor = .black
        self.sideMenuShadowView.alpha = 0.0
        self.sideMenuShadowView.isHidden = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TapGestureRecognizer))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.delegate = self
        sideMenuShadowView.addGestureRecognizer(tapGestureRecognizer)
        if self.revealSideMenuOnTop {
            view.insertSubview(self.sideMenuShadowView, aboveSubview: self.view)
        }
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        self.sideMenuViewController = storyboard.instantiateViewController(withIdentifier: "sideMenu") as? SideMenuViewController
        self.sideMenuViewController.defaultHighlightedCell = 0 // Default Highlighted Cell
        self.sideMenuViewController.delegate = self
        view.insertSubview(sideMenuViewController.view!, aboveSubview: self.view)
        addChild(self.sideMenuViewController!)
        self.sideMenuViewController!.didMove(toParent: self)
        self.sideMenuViewController!.view!.isHidden = true
        // Side Menu AutoLayout

        self.sideMenuViewController.view.translatesAutoresizingMaskIntoConstraints = false
        if self.revealSideMenuOnTop {
            self.sideMenuTrailingConstraint = self.sideMenuViewController.view.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: +self.sideMenuRevealWidth + self.paddingForRotation + sideMenuRevealWidth )
            self.sideMenuTrailingConstraint.isActive = true
        }
        NSLayoutConstraint.activate([
      /* width of side menu */      self.sideMenuViewController.view.widthAnchor.constraint(equalToConstant: self.sideMenuRevealWidth),
            self.sideMenuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.sideMenuViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        panGestureRecognizer.delegate = self
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @IBAction func settingsAction(_ sender: Any) {
        self.sideMenuState(expanded: self.isExpanded ? false : true)

    }
    @IBAction func readAction(_ sender: Any) {
    }
    @IBAction func questionsAction(_ sender: Any) {
    }
    
    func sideMenuState(expanded: Bool) {
        if expanded {
            self.animateSideMenu(targetPosition: self.revealSideMenuOnTop ?self.view.frame.width : 0) { _ in
                self.isExpanded = true
            }
            // Animate Shadow (Fade In)
            UIView.animate(withDuration: 0.5) { self.sideMenuShadowView.alpha = 0.6 }
        }
        else {
            self.animateSideMenu(targetPosition: self.revealSideMenuOnTop ? self.view.frame.width + self.sideMenuRevealWidth : 0) { _ in
                self.isExpanded = false
            }
            // Animate Shadow (Fade Out)
            UIView.animate(withDuration: 0.5) { self.sideMenuShadowView.alpha = 0.0 }
        }
    }
    // MARK: - selected sidemenu
 
    func animateSideMenu(targetPosition: CGFloat, completion: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .layoutSubviews, animations: {
            if self.revealSideMenuOnTop {
                self.sideMenuTrailingConstraint.constant =  targetPosition
                self.view.layoutIfNeeded()
            }
            else {
                self.view.subviews[1].frame.origin.x = -targetPosition
            }
        }, completion: completion)
    }

    func getData(token:String){
        userProfile.getData(param: ["token" : token])
       
    }


    func setData(data: UserProfile){
        profileName.text = "\( data.data.name.split(separator: " ").first!)"
        self.downloadImage(from: data.data.avtar) { (img) in
            if let _ = img{
                DispatchQueue.main.async {
                    self.userImageView.image = img
                }
            }
        }
        starCountLabel.text = String(describing: data.data.totalStars)
       // userAvatar.getData(param: ["user_id":data.data.id])

    }
    
    @IBAction func kheloActivity(_ sender: Any) {
    }
    
    @IBAction func karo(_ sender: Any) {
        let storybd = UIStoryboard(name: "Karo", bundle: nil)
        let vc = storybd.instantiateViewController(withIdentifier: "KaroViewController") as! KaroViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func dekho(_ sender: Any) {
    }
    @IBAction func suno(_ sender: Any) {
    }
}
extension DashboardViewController:UserModelDelegate{
    func gotData(data: UserProfile) {
        setData(data: data)
    }
    
    func gettingDataFailed(message: String) {
        if message == "Token is Expired"{
            let storybd = UIStoryboard(name: "Main", bundle: nil)
            let vc = storybd.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
   
}

extension DashboardViewController:AvatarModelDelegate{
    func gotData(data: AvatarByUser) {
//        if let img = self.getImageFromUrl(str: data.data.avtar){
//                userImageView.image = img
//        }
        print(data.data.avtar)
        self.downloadImage(from: data.data.avtar) { (img) in
            if let _ = img{
                DispatchQueue.main.async {
                    self.userImageView.image = img
                }
            }
        }
    }
    
    
}
extension UIViewController{
    func  getImageFromUrl(str:String)-> UIImage?{
        if let url = URL(string: str){
             let data = url.dataRepresentation
            let img = UIImage(data: data)
            return img!
        }
        return nil
    }
    
    
//    func downloadImage(from URLString: String, with completion: @escaping (_ response: (status: Bool, image: UIImage? ) ) -> Void) {
//        guard let url = URL(string: URLString) else {
//            completion((status: false, image: nil))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else {
//                completion((status: false, image: nil))
//                return
//            }
//
//            guard let httpURLResponse = response as? HTTPURLResponse,
//                  httpURLResponse.statusCode == 200,
//                  let data = data else {
//                completion((status: false, image: nil))
//                return
//            }
//
//            let image = UIImage(data: data)
//            completion((status: true, image: image))
//        }.resume()
//    }
}

extension DashboardViewController:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell
        cell.logo.image = collectionData[indexPath.row].1
        cell.title.text = collectionData[indexPath.row].0
        if indexPath.row == selectedIndex{
            cell.contentView.backgroundColor = #colorLiteral(red: 0.2395668328, green: 0.5120059848, blue: 0.1375722289, alpha: 1)
        }else{
            cell.contentView.backgroundColor = #colorLiteral(red: 0.3161534667, green: 0.6725689173, blue: 0.2606477141, alpha: 1)
        }
        cell.isUserInteractionEnabled = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/3, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        hideContentController(content: self.children.last!.isKind(of: SideMenuViewController.self) ? self.children.first! : self.children.last!)
        
        if indexPath.row == 0{
//            let controller =  storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//            addContentController(content: controller)

        }else if indexPath.row == 1{
          // let controller =  storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
          //  addContentController(content: controller)
        }else{
//            let controller =  storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
//             addContentController(content: controller)
        }
        let cell = collectionView.cellForItem(at: indexPath) as! TabCollectionViewCell
        cell.contentView.backgroundColor = #colorLiteral(red: 0.2395668328, green: 0.5120059848, blue: 0.1375722289, alpha: 1)
        let cell2 = collectionView.cellForItem(at: IndexPath(item: selectedIndex, section: 0)) as! TabCollectionViewCell
        cell2.contentView.backgroundColor = #colorLiteral(red: 0.3161534667, green: 0.6725689173, blue: 0.2606477141, alpha: 1)
        selectedIndex = indexPath.row
    }
//    func addContentController(content: UIViewController) {
//        content.view.frame = containerView.bounds
//        self.addChild(content)
//        containerView.addSubview(content.view)
//        content.didMove(toParent: self)
//    }
    func hideContentController(content: UIViewController) {
        content.willMove(toParent: nil)
        content.view.removeFromSuperview()
        content.removeFromParent()
        
    }

}
extension DashboardViewController: UIGestureRecognizerDelegate {
    @objc func TapGestureRecognizer(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if self.isExpanded {
                self.sideMenuState(expanded: false)
            }
        }
    }

    // Close side menu when you tap on the shadow background view
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: self.sideMenuViewController.view))! {
            return false
        }
        return true
    }
    
    // Dragging Side Menu
    @objc private func handlePanGesture(sender: UIPanGestureRecognizer) {
        
        guard gestureEnabled == true else { return }

        let position: CGFloat = sender.translation(in: self.view).x
        let velocity: CGFloat = sender.velocity(in: self.view).x

        switch sender.state {
        case .began:

            // If the user tries to expand the menu more than the reveal width, then cancel the pan gesture
            if velocity > 0, self.isExpanded {
                sender.state = .cancelled
            }

            // If the user swipes right but the side menu hasn't expanded yet, enable dragging
            if velocity > 0, !self.isExpanded {
                self.draggingIsEnabled = true
            }
            // If user swipes left and the side menu is already expanded, enable dragging
            else if velocity < 0, self.isExpanded {
                self.draggingIsEnabled = true
            }

            if self.draggingIsEnabled {
                // If swipe is fast, Expand/Collapse the side menu with animation instead of dragging
                let velocityThreshold: CGFloat = 550
                if abs(velocity) > velocityThreshold {
                    self.sideMenuState(expanded: self.isExpanded ? false : true)
                    self.draggingIsEnabled = false
                    return
                }

                if self.revealSideMenuOnTop {
                    self.panBaseLocation = 0.0
                    if self.isExpanded {
                        self.panBaseLocation = self.sideMenuRevealWidth
                    }
                }
            }

        case .changed:

            // Expand/Collapse side menu while dragging
            if self.draggingIsEnabled {
                if self.revealSideMenuOnTop {
                    // Show/Hide shadow background view while dragging
                    let xLocation: CGFloat = self.panBaseLocation + position
                    let percentage = (xLocation * 150 / self.sideMenuRevealWidth) / self.sideMenuRevealWidth

                    let alpha = percentage >= 0.6 ? 0.6 : percentage
                    self.sideMenuShadowView.alpha = alpha

                    // Move side menu while dragging
                    if xLocation <= self.sideMenuRevealWidth {
                        self.sideMenuTrailingConstraint.constant = xLocation - self.sideMenuRevealWidth
                    }
                }
                else {
                    if let recogView = sender.view?.subviews[1] {
                        // Show/Hide shadow background view while dragging
                        let percentage = (recogView.frame.origin.x * 150 / self.sideMenuRevealWidth) / self.sideMenuRevealWidth

                        let alpha = percentage >= 0.6 ? 0.6 : percentage
                        self.sideMenuShadowView.alpha = alpha

                        // Move side menu while dragging
                        if recogView.frame.origin.x <= self.sideMenuRevealWidth, recogView.frame.origin.x >= 0 {
                            recogView.frame.origin.x = recogView.frame.origin.x + position
                            sender.setTranslation(CGPoint.zero, in: view)
                        }
                    }
                }
            }
        case .ended:
            self.draggingIsEnabled = false
            // If the side menu is half Open/Close, then Expand/Collapse with animation
            if self.revealSideMenuOnTop {
                let movedMoreThanHalf = self.sideMenuTrailingConstraint.constant > -(self.sideMenuRevealWidth * 0.5)
                self.sideMenuState(expanded: movedMoreThanHalf)
            }
            else {
                if let recogView = sender.view?.subviews[1] {
                    let movedMoreThanHalf = recogView.frame.origin.x > self.sideMenuRevealWidth * 0.5
                    self.sideMenuState(expanded: movedMoreThanHalf)
                }
            }
        default:
            break
        }
    }
}

extension DashboardViewController: SideMenuViewControllerDelegate{
    func selectedCell(_ row: Int) {
        self.sideMenuState(expanded: self.isExpanded ? false : true)
        print(row)
    }
    

}
