//
//  SamajhBadhanaViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 19/07/22.
//

import UIKit

class SamajhBadhanaViewController: UIViewController {
    
    let titleArr = ["बराबरी विषय पर समझ बढ़ाना " , "मैं भी सुन्दर हूँ","साफ़ सुंदर स्वच्छ","""
शादी के लिए
    जल्दी क्या?
""", "आपसी मतभेद को करें खत्म" , "मेरा प्रिय मित्र" , "किस से है पहचान मेरी"]
    
    let descriptionAray = [" दी गई तस्वीरों में बराबरी किन-किन में दिख रही है? जहां बराबरी हो वहाँ टिक लगाओ।", "क्या सुंदरता बस आप कैसे दिखते हो उससे पता चलती है या फिर आपके अंदर के गुण भी आपको सुन्दर बना सकते हैं? आज हम यह जानेंगे एक एक्टिविटी के ज़रिये।" , """
आपके आस-पास कूड़ा, खुली नाली या गन्दगी
        फैली होगी तो आपको कैसा लगेगा? आपके परिवार
        पर इसका क्या प्रभाव पड़ेगा? अगर आपके घर के
        आस-पास ऐसी कोई गन्दगी है तो आप क्या करेंगे?
""","अभी हमारी उम्र पढ़ने लिखने की है, मज़ा करने की है। जल्दी शादी हो जाएगी तो हमारे यह सपने पूरे नहीं हो सकेंगे।" , """
        आज हम सीखेंगे कि किस तरह आपसी मतभेद
        खत्म किया जा सकता है।
        हम यह भी समझेंगे कि किस तरह सही विकल्प का चुनाव और चुनावों के परिणाम को
        आपसी मतभेद खत्म करने के लिए परख सकते हैं।
        """ , """
        वैसे तो हम अपने मित्रों से रोज़ ही
                           मिलते  हैं, स्कूल में, स्कूल के बाद खेलने के लिए और कभी कभी सुबह भी। परन्तु पिछले कुछ दिनों से जब से कोरोना आया है तबसे हमारा मिलना जुलना भी कम हो गया है, तो क्यों ना आज हम अपने दोस्त को खुश करें?
        """, """
        आपकी पहचान किस से है? क्या वह केवल पिता से है?
        या माँ से या दोनों से?
        """]
    var karoActivityNumber : Int?
    @IBOutlet weak var avtarImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var starCountLbl: UILabel!
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKaroBackGroundImage()
        titlelabel.text = titleArr[karoActivityNumber!]
        descriptionLabel.text = descriptionAray[karoActivityNumber!]

        // Do any additional setup after loading the view.
    }
    

    @IBAction func gyanBox(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GyanBoxViewController") as! GyanBoxViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func kyaKarnaHai(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "KyaKarnaViewController") as! KyaKarnaViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popToAViewController(ofClass: KaroViewController.self, animated: true)
    }
    
    @IBAction func next(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Activity1ViewController") as! Activity1ViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
