//
//  ViewController.swift
//  SearchBar
//
//  Created by Admin on 12/02/2018.
//  Copyright © 2018 Kwangun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataModel:Model!
    
    @IBOutlet weak var Viewcontent: UILabel!
    @IBOutlet weak var Viewtype: UILabel!
    @IBOutlet weak var Viewname: UILabel!
    @IBOutlet weak var Viewimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Viewname.text = dataModel.imageName
        Viewtype.text = dataModel.imageType
        Viewcontent.text = dataModel.imageContent
        Viewimg.image = UIImage(named:dataModel.image)
        
        let ViewcontentHeight = Viewcontent.optimalHeight
        Viewcontent.frame = CGRect(x: Viewcontent.frame.origin.x, y: Viewcontent.frame.origin.y, width: Viewcontent.frame.width, height: ViewcontentHeight)
        
        Viewcontent.numberOfLines = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

