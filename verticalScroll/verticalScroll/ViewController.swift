//
//  ViewController.swift
//  verticalScroll
//
//  Created by Admin on 09/01/2018.
//  Copyright © 2018 Kwangun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
    
    
    @IBOutlet weak var Constrain: NSLayoutConstraint!
    
    var constrainidden = true
    @IBAction func MenuButton(_ sender: UIButton) {
        
        if constrainidden {
            Constrain.constant = 0
            
            UIView.animate(withDuration: 0.1, animations: {self.view.layoutIfNeeded()})
            
        }else {
            Constrain.constant = -140
            
            UIView.animate(withDuration: 0.1, animations: {self.view.layoutIfNeeded()})
        }
        constrainidden = !constrainidden
        
    }
    
    
    @IBAction func Button(_ sender: Any) {
        
        performSegue(withIdentifier: "moteTo", sender: self)
        
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var contentWidth:CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Constrain.constant = -140
        
        scrollView.delegate = self
        //let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        //let button = UIButton(type: UIButtonType.custom)
        //let image = UIImage(named: "0.jpg")
        //let image2 = UIImage(named: "1.jpg")
        
        /*button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
         button.setImage(image, for: UIControlState.normal)
         button.setImage(image2, for: UIControlState.highlighted)
        
        view.addSubview(button)
        
        */
        //var imageView = UIImageView()
        
        for image in 0...2 {
            
            //let imageToDisplay = UIImage(named: "\(image).jpg")
            let imageToDisplay = UIImage(named: "\(image).jpg")
            let imageToDisplay2 = UIImage(named: "main.jpg")
            //imageView = UIImageView(image: imageToDisplay)
            let xCoordinate = view.frame.width * CGFloat(image)
            contentWidth += view.frame.width
            //imageView.frame = CGRect(x: xCoordinate, y: 0, width: 400, height: 200)
            
            let button = UIButton(frame: CGRect(x: xCoordinate, y: 0, width: 400, height: 200))
            //button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
            button.setImage(imageToDisplay, for: UIControlState.normal)
            button.setImage(imageToDisplay2, for: UIControlState.highlighted)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            scrollView.addSubview(button)
            //button.addTarget(self, action: #selector(checkMarkButton), for: t)
            
            
        }
        
        scrollView.contentSize = CGSize(width: contentWidth , height: scrollView.frame.height)//view.frame.height)
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414)) // 이게 있잖아요? 슬라이드를해줘요.
    }
    
    @objc func buttonAction(sender: UIButton){
        
        performSegue(withIdentifier: "moveTo", sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

