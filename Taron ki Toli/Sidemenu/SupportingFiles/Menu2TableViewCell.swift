//
//  Menu2TableViewCell.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 13/07/22.
//

import UIKit

class Menu2TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dropdDownButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UITableViewCell{
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
}
