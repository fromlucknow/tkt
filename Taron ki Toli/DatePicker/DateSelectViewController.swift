//
//  DateSelectViewController.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 15/06/22.
//

import UIKit
protocol DatePickerDelegate {
    func dateSelected(date:Date)
}
class DateSelectViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    var delegate : DatePickerDelegate!
    var type = "date"
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // addBackGroundImage()
        if type != "date"{
            datePicker.datePickerMode = .time
        }else{
            datePicker.datePickerMode = .date
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func dateChanged(_ sender: UIDatePicker) {
        delegate.dateSelected(date: sender.date)
       
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
