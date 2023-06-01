//
//  Menu1TableViewCell.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 13/07/22.
//

import UIKit

class Menu1TableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
//    class var identifier: String { return String(describing: self) }
//    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    @IBOutlet weak var switchButton: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        switchButton.offImage = #imageLiteral(resourceName: "fireBall")
        switchButton.onImage = #imageLiteral(resourceName: "greenBox2")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
