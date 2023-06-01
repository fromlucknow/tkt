//
//  SelectDayViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 21/06/22.
//

import UIKit
import SwiftRangeSlider
class SelectDayViewController: UIViewController,DatePickerDelegate {
    let days = ["S","M", "T", "W", "THU" , "F" , "SAT"]
    var daysSelected = [String]()
    var time :String!
    private var successModel :SuccessModel!
    func dateSelected(date: Date) {
        print(date)
        let formater = DateFormatter()
        formater.dateFormat = "h:mm a"
        timeLabel.text = formater.string(from: date)
        formater.dateFormat = "H:mm"
        time = formater.string(from: date)
      // print( formater.string(from: date))
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    let timeValue = ["15","30","45","60","90"]
    var targetLimit = "15"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackGroundImage()
        successModel = SuccessModel()
        successModel.successDelegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var day: [UIButton]!
    
    @IBAction func sliderAdjusted(_ sender: RangeSlider) {
        targetLimit =  timeValue[Int(sender.upperValue)]
    }
    
     @IBAction func daySelection(_ sender: UIButton) {
        
//        for but in day{
//            but.setBackgroundImage(UIImage(named: "box2Invert"), for: .normal)
//        }
        if sender.backgroundImage(for: .normal) == UIImage(named: "box2Invert"){
        sender.setBackgroundImage(UIImage(named: "box2"), for: .normal)
            daysSelected.append(days[sender.tag - 1])
        }else{
            sender.setBackgroundImage(UIImage(named: "box2Invert"), for: .normal)
           // if daysSelected.contains(days[sender.tag - 1]){
            daysSelected.remove(at: daysSelected.firstIndex(of: days[sender.tag - 1])!)
           // }
        }
     }
     // MARK: - Navigation

    @IBAction func selectTime(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DateSelectViewController") as! DateSelectViewController
        vc.type = "time"
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func dailyButton(_ sender: UIButton) {
        if sender.backgroundImage(for: .normal) == UIImage(systemName: "circle"){
            sender.setBackgroundImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
        for but in day{
            
            but.setBackgroundImage(UIImage(named: "box2"), for: .normal)
            
        }
            daysSelected.removeAll()
            daysSelected = days
        }else{
            sender.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            for but in day{
                but.setBackgroundImage(UIImage(named: "box2Invert"), for: .normal)
            }
            day[0].setBackgroundImage(UIImage(named: "box2"), for: .normal)
            daysSelected.removeAll()
            daysSelected = ["a"]
        }
       
     }
    var apiCount = 0
    @IBAction func next(_ sender: Any) {
        
        let data = UserDefaults.standard.dictionary(forKey: "ProfileData")
        if !daysSelected.isEmpty && time != nil && !targetLimit.isEmpty{
            successModel.success(param: [
                "user_id":"\(data!["user_id"] as! Int)",
                "weekly_target":targetLimit,
                "days": daysSelected.joined(),
                "time":time
                
            ], url:WEEKLY_TARGET )
        }
        
    }
}

extension SelectDayViewController: SuccessDelegate{
    
    func success(data: Success) {
        
        if data.status == 1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func failed(message: String) {
        
        
        
    }
    
    
}
