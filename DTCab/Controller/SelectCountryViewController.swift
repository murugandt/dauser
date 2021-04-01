//
//  SelectCountryViewController.swift
//  CountryPickerViewDemo
//
//  Created by Apple on 06/03/21.
//  Copyright © 2021 Kizito Nwose. All rights reserved.
//

import UIKit

struct CountryData: Codable {
    var name: String
    var dial_code: String
    var code: String
}

protocol CountrySelectionDelegate {
    func selectedCountryData(countryCode: String, viewController: UIViewController)
}

class SelectCountryViewController: BaseViewController, UISearchBarDelegate {
    
    var data = DataLoader().countryData
    var filteredData = [CountryData]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var headerView: HeaderView!
    
    var countrySelectionDelegate: CountrySelectionDelegate?
    
    var isFiltered = false
    let collation = UILocalizedIndexedCollation.current()
    var sectionTitles: [String] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    var sections: [[CountryData]] = []
    var states: [CountryData] = [] {
        didSet {
            sections = Array(repeating: [], count: sectionTitles.count)
            
            let sortedStates = states.sorted { (lhs, rhs) -> Bool in
                lhs.name < rhs.name
            }
            
            for state in sortedStates {
                guard
                    let first = state.name.first,
                    let sectionIndex = sectionTitles.index(of: String(first)) else { return }
                sections[sectionIndex].append(state)
            }
            self.tableView.reloadData()
        }
    }
    
    func loadStates() {
        
        for i in data {
            data = data.filter {$0.name != i.name}
            let str = i.name.capitalized
            data.append(i)
        }
        states = data
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData.removeAll()
        
        let pattern = "\\b" + NSRegularExpression.escapedPattern(for: searchText)
        filteredData = data.filter {
            $0.name.range(of: pattern, options: .regularExpression) != nil
        }
        
        //  filteredData = data.filter { $0.name.range(of: str, options: .caseInsensitive) != nil }
        
        if (searchText == "") {
            let str = searchText
            if str.count == 0 {
                isFiltered = false
            }
        } else {
            isFiltered = true
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.tableView.sectionIndexColor = App.ButtonDoneColor.Color

        headerView.titleLabel.text = "Select a country"
        headerView.backBtn.addTarget(self, action: #selector(self.btnBack(_:)), for: .touchUpInside)
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            
            textfield.backgroundColor = UIColor.init(hexString: "#D1D1E9").withAlphaComponent(0.35)
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.lightGray
            }
        }
        
        for i in data {
            data = data.filter {$0.name != i.name}
            let str = i.name.capitalized
            data.append(i)
        }
        
        loadStates()
        tableView.reloadData()
    }
    
    private func clearBackgroundColor() {
        guard let UISearchBarBackground: AnyClass = NSClassFromString("UISearchBarBackground") else { return }
        
        for view in self.view.subviews {
            for subview in view.subviews where subview.isKind(of: UISearchBarBackground) {
                subview.alpha = 0
            }
        }
    }
}

extension SelectCountryViewController: UITableViewDelegate {}

extension SelectCountryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if(isFiltered) {
            return 1
        } else {
            return sections.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isFiltered) {
            return filteredData.count
        } else {
            return sections[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.font = UIFont(name:"Avenir Next",size:19.0)
        
        if(isFiltered) {
            cell.textLabel?.text = "\(filteredData[indexPath.row].name) (\(filteredData[indexPath.row].dial_code))"
            let text = (cell.textLabel?.text)!
            let attributeString = NSMutableAttributedString(string: text)
            let numRange = (text as NSString).range(of: "(\(filteredData[indexPath.row].dial_code))")
            attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: numRange)
            cell.textLabel?.attributedText = attributeString
        } else {
            cell.textLabel?.text = "\(sections[indexPath.section][indexPath.row].name) (\(sections[indexPath.section][indexPath.row].dial_code))"
            let text = (cell.textLabel?.text)!
            let attributeString = NSMutableAttributedString(string: text)
            let numRange = (text as NSString).range(of: "(\(sections[indexPath.section][indexPath.row].dial_code))")
            attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: numRange)
            cell.textLabel?.attributedText = attributeString
        }
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if(isFiltered) {
            return []
        } else {
            return sectionTitles
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var countryCode = String()
        if(isFiltered) {
            countryCode = filteredData[indexPath.row].dial_code
        } else {
            countryCode = sections[indexPath.section][indexPath.row].dial_code
        }
        countrySelectionDelegate?.selectedCountryData(countryCode: countryCode, viewController: self)
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}


