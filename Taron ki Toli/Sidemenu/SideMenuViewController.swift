//
//  SideMenuViewController.swift
//  CustomSideMenuiOSExample
//
//  Created by John Codeos on 2/7/21.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: UIViewController {
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var sideMenuTableView: UITableView!
    @IBOutlet var footerLabel: UILabel!

    var delegate: SideMenuViewControllerDelegate?

    var defaultHighlightedCell: Int = 0

    var menu: [SideMenuModel] = [
        SideMenuModel(title: "अकाउंट "),
        SideMenuModel(title: "प्राइवेसी एंड सिक्योरिटी "),
        SideMenuModel(title: "टर्म्स एंड कंडीशंस "),
        SideMenuModel(title: "TKT के बारे में "),
        SideMenuModel(title: "संगीत"),
        SideMenuModel(title: "ऑडियो"),
        SideMenuModel(title: "लैंग्वेज"),
        SideMenuModel(title: "शेयर"),
        SideMenuModel(title: "चाइल्ड पालिसी")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // TableView
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
        self.sideMenuTableView.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.2784313725, blue: 0.2745098039, alpha: 1)
        self.sideMenuTableView.separatorStyle = .none

        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }

        // Footer
        self.footerLabel.textColor = UIColor.white
        self.footerLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.footerLabel.text = ""

        // Register TableView Cell
        self.sideMenuTableView.register(SideMenuCell.nib, forCellReuseIdentifier: SideMenuCell.identifier)
        self.sideMenuTableView.register(Menu1TableViewCell.nib, forCellReuseIdentifier: Menu1TableViewCell.identifier)
        self.sideMenuTableView.register(Menu2TableViewCell.nib, forCellReuseIdentifier: Menu2TableViewCell.identifier)

        // Update TableView with the data
        self.sideMenuTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

// MARK: - UITableViewDataSource

extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Menu1TableViewCell.identifier, for: indexPath) as? Menu1TableViewCell else { fatalError("xib doesn't exist") }

           // cell.iconImageView.image = self.menu[indexPath.row].icon
            cell.titleLabel.text = self.menu[indexPath.row].title

            // Highlighted color
//            let myCustomSelectionColorView = UIView()
//            myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.2784313725, blue: 0.2745098039, alpha: 1)
//            cell.selectedBackgroundView = myCustomSelectionColorView
            return cell
            
        }else if indexPath.row == 4{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Menu2TableViewCell.identifier, for: indexPath) as? Menu2TableViewCell else { fatalError("xib doesn't exist") }

           // cell.iconImageView.image = self.menu[indexPath.row].icon
            cell.titleLabel.text = self.menu[indexPath.row].title

            // Highlighted color
//            let myCustomSelectionColorView = UIView()
//            myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.2784313725, blue: 0.2745098039, alpha: 1)
//            cell.selectedBackgroundView = myCustomSelectionColorView
            return cell
            
        } else {  guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else { fatalError("xib doesn't exist") }

       // cell.iconImageView.image = self.menu[indexPath.row].icon
        cell.titleLabel.text = self.menu[indexPath.row].title

        // Highlighted color
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.2784313725, blue: 0.2745098039, alpha: 1)
        cell.selectedBackgroundView = myCustomSelectionColorView
        return cell
            
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
        // Remove highlighted color when you press the 'Profile' and 'Like us on facebook' cell
        if indexPath.row == 4 || indexPath.row == 6 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
