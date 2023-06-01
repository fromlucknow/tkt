//
//  KaroViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 15/07/22.
//

import UIKit

class KaroViewController: UIViewController {

    @IBOutlet weak var carousalView: UICollectionView!
    var newPage = Float(0)
    let karoTitles = ["बराबरी विषय पर समझ बढ़ाना","मैं भी सुन्दर हूँ","साफ़ सुंदर स्वच्छ" ,"शादी के लिए जल्दी क्या?","आपसी मतभेद को करें खत्म","मेरा प्रिय मित्र","किस से है पहचान मेरी"]
    override func viewDidLoad() {
        super.viewDidLoad()
        addKaroBackGroundImage()
        carousalView.collectionViewSetupWithViewC(ViewController: self, cellArrayToRegister: [KaroCollectionViewCell.getCellIdentifier()])
        carousalView.delegate = self
        carousalView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        carousalView.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
 
}

extension KaroViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KaroCollectionViewCell", for: indexPath) as! KaroCollectionViewCell
        cell.bannerImage.image = UIImage(named: "karo\(indexPath.row + 1)")
        cell.lbl.text = karoTitles[indexPath.row]
        cell.nextBut.tag = indexPath.row
        cell.nextBut.addTarget(self, action: #selector(moveToActivity(_:)), for: .touchUpInside)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.height * 1111 / 1640) - 100
        let height = width * 1640 / 1111
        return CGSize(width: width, height: height)
    }
   
    @objc func moveToActivity(_ sender : UIButton){
        if sender.tag == 0{
            let vc = storyboard?.instantiateViewController(withIdentifier: "Karo1ViewController") as! Karo1ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "Karo2ViewController") as! Karo2ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension KaroViewController:UIScrollViewDelegate{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let c = (carousalView.frame.height * 1111 / 1640)
        
        let p = self.view.frame.width - (c - 100 + 30 )
        
        let pageWidth = Float(c - 100 + 30)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(carousalView!.contentSize.width  )
      //  var newPage = Float(self.pageControl.currentPage)

        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? self.newPage + 1 : self.newPage - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / pageWidth) {
                newPage = ceil(contentWidth / pageWidth) - 1.0
            }
        }

       // self.pageControl.currentPage = Int(newPage)
        let point = CGPoint (x: CGFloat(newPage * (pageWidth)), y: targetContentOffset.pointee.y)
       // if newPage != 0 {
        print(p)
        let cp = point.x - ((p+30)/2)
            targetContentOffset.pointee = CGPoint(x: CGFloat(cp), y: point.y)
   //     }else{
      //  targetContentOffset.pointee = point
     //   }
    }
}
