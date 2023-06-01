//
//  AvatarViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 23/05/22.
//

import UIKit

class AvatarViewController: UIViewController,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var avatarCollectionView: UICollectionView!
    private var avatarModel : AllAvatarsModel!
    private var successModel :SuccessModel!
    var allAvatars = [Avatars]()
    var avatarId :Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackGroundImage()
        avatarModel = AllAvatarsModel()
        avatarModel.delegate = self
        avatarModel.getAvatars()
        successModel = SuccessModel()
        successModel.successDelegate = self
        
        let layt = UICollectionViewFlowLayout()
        layt.scrollDirection = .vertical
        layt.minimumLineSpacing = 00
        layt.minimumInteritemSpacing = 0
        layt.itemSize = CGSize(width: self.view.frame.width/2 - 40, height: self.view.frame.width/2 )
        layt.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        avatarCollectionView.collectionViewLayout = layt
        
        avatarCollectionView.collectionViewSetupWithViewC(ViewController: self, cellArrayToRegister: [AvatarCollectionViewCell.getCellIdentifier()])
        avatarCollectionView.delegate = self
        avatarCollectionView.dataSource = self
        avatarCollectionView.register(UINib(nibName: "cellhead", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeadCollectionReusableView") //elementKindSectionFooter for footerview
     
    }
 
    @IBAction func next(_ sender: Any) {
        if let _ = avatarId{
            let data = UserDefaults.standard.dictionary(forKey: "ProfileData")
            //value(forKey: "ProfileData") as! Register
            print("User data ==== >>>>> ", data)
            successModel.success(param: ["user_id": data!["user_id"] , "avtar_id":"\(avatarId!)"], url: SET_AVATAR)
        }
            }
}

extension AvatarViewController :UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return allAvatars.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = avatarCollectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCollectionViewCell", for: indexPath) as! AvatarCollectionViewCell
        self.downloadImage(from: allAvatars[indexPath.row].avtar) { (img) in
            if let _ = img{
                DispatchQueue.main.async {
                    cell.avatarImageView.image = img
                }
            }
        }
        cell.avatarImageView.image = UIImage(named: "avtr\(indexPath.row + 1)")
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2 - 70, height: self.view.frame.width/2 - 50 )
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
       
        switch kind {
                      
         case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(
                 ofKind: kind,
                 withReuseIdentifier: "cellhead",
                 for: indexPath) as! HeadCollectionReusableView
            return headerView
                  
          case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(
                 ofKind: kind,
                 withReuseIdentifier: "cellFoot",
                 for: indexPath) as! UICollectionReusableView
            return footerView
                  
           default:
                  assert(false, "Unexpected element kind")
          }
      
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        avatarId = allAvatars[indexPath.row].id
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 77)
    }
    
}

extension AvatarViewController: AllAvatarsDelegate{
    
    func avatarsFound(data: AllAvatars) {
        allAvatars = data.data
        avatarCollectionView.reloadData()
    }
    
    func ravatarFoundFailed(message: String) {
        
    }
    
    
}
extension AvatarViewController:SuccessDelegate{
    func success(data: Success) {
        if data.status == 1{
            let vc = self.storyboard!.instantiateViewController(withIdentifier:"SelectDayViewController") as! SelectDayViewController
            self.navigationController?.pushViewController(vc, animated: true)

        }
    }
    
    func failed(message: String) {
        print("failed=====>> fail")
    }
    
    
}
extension UIViewController{
    func downloadImage(from URLString: String, with completion: @escaping (_ response: ( UIImage? ) ) -> Void) {
        guard let url = URL(string: URLString) else {
            
            completion(nil)
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion( nil)
                return
            }
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200,
                  let data = data else {
                completion( nil)
                return
            }
            
            let image = UIImage(data: data)
            completion( image)
        }.resume()
    }
}
