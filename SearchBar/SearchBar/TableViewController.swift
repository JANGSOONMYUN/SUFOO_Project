//
//  TableViewController.swift
//  SearchBar
//
//  Created by Admin on 12/02/2018.
//  Copyright © 2018 Kwangun. All rights reserved.
//

import UIKit

enum selectedScope:Int {
    case name = 0
    case type = 1
}

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    let initialDataAry:[Model] = Model.generateModelArray()
    var dataAry:[Model] = Model.generateModelArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarSetup()
    }
    
    func searchBarSetup() {
    
        let searchController = UISearchController(searchResultsController: nil)
       
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for SUFO"
        
        //searchController.searchBar.Move
        //searchController.searchBar.setPositionAdjustment(UIOffsetMake(255, 0), forSearchBaricon
        //searchController.searchBar.setPositionAdjustment(UIOffsetMake(200, 0), for: .search)
        //searchController.searchBar.searchTextPositionAdjustment(UIOffsetMake(-270, 0))
        
        
        //searchController.searchBar.searchTextPositionAdjustment = UIOffsetMake(-150, 0)
        //searchController.searchBar.setPositionAdjustment(UIOffsetMake(255, 0), for: .search)
        
        
        searchController.searchBar.setImage(UIImage(named:"search"), for: .search, state: .normal)
        
        //searchController.searchBar.setImage(UIImage(named:"1"), for: .search, state: .highlighted)
        
        //SearchBar Text
       //let textFieldInsideUISearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        //textFieldInsideUISearchBar?.textColor = UIColor.white
        //textFieldInsideUISearchBar?.leftView
        //textFieldInsideUISearchBar?.sizeToFit()
        //SearchBar Placeholder
        //let textFieldInsideUISearchBarLabel = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        //textFieldInsideUISearchBarLabel?.textColor = UIColor.gray
        //textFieldInsideUISearchBarLabel?.textAlignment = NSTextAlignment.right
        //textFieldInsideUISearchBarLabel?.size
 
       
        let frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        
        let titleView = UIView(frame: frame)
        
        searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.frame = frame
        titleView.addSubview(searchController.searchBar)
        navigationItem.titleView = titleView
        /*
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.setImage(UIImage(named:"search"), for: .search, state: .normal)
       
        //searchBar.backgroundColor = UIColor.red
        searchBar.barTintColor = UIColor(white:1, alpha: 0)
        searchBar.showsScopeBar = true
       *//*
        let textFieldInsideSearchBar = searchBar.valueForKey("searchField") as? UITextField
        let imageV = textFieldInsideSearchBar?.leftView as! UIImageView
        imageV.image = imageV.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        imageV.tintColor = UIColor.purpleColor()
        */
        
        
        
        //searchBar.scopeButtonTitles = ["Name","Year","By"]
        //searchBar.selectedScopeButtonIndex = 0
        //searchBar.delegate = self
        //self.tableView.tableHeaderView = searchBar
    }
    
    
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataAry = initialDataAry
            self.tableView.reloadData()
        }else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
    
    func filterTableView(ind:Int,text:String) {
        switch ind {
        case selectedScope.name.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.imageName.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScope.type.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.imageType.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        
        default:
            print("no type")
        }
    }
    
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataAry.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let model = dataAry[indexPath.row]
        
        cell.nameLbl.text = model.imageName
        cell.img.image = UIImage(named: model.image)
        cell.typeLbl.text = model.imageType
        //cell.contentLbl.text = model.imageContent
        
        
        return cell
    }
    
    //add delegate method for pushing to new detail controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.dataModel = dataAry[indexPath.row]
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

