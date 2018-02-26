//
//  ViewController.swift
//  ScrollView1.0
//
//  Created by Admin on 08/02/2018.
//  Copyright © 2018 Kwangun. All rights reserved.
//

import UIKit

extension UISearchBar {
    private func getViewElement<T>(type: T.Type) -> T? {
        
        
        let svs = subviews.flatMap { $0.subviews }
        
        guard let element = (svs.filter { $0 is T }).first as? T else { return nil }
        
        return element
        
    }
    
    
    func getSearchBarTextField() -> UITextField? {
        
        return getViewElement(type: UITextField.self)
        
    }
    
    
    func setTextColor(color: UIColor) {
        
        
        if let textField = getSearchBarTextField() {
            
            textField.textColor = color
            
        }
        
    }
    
    
    func setTextFieldColor(color: UIColor) {
        
        
        if let textField = getViewElement(type: UITextField.self) {
            
            switch searchBarStyle {
                
            case .minimal:
                
                textField.layer.backgroundColor = color.cgColor
                
                textField.layer.cornerRadius = 6
                
            case .prominent, .default:
                
                textField.backgroundColor = color
                
            }
            
        }
        
    }
    
    
    func setPlaceholderTextColor(color: UIColor) {
        
        
        if let textField = getSearchBarTextField() {
            
            textField.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedStringKey.foregroundColor: color])
            
        }
        
    }
    
    
    func setTextFieldClearButtonColor(color: UIColor) {
        
        
        if let textField = getSearchBarTextField() {
            
            
            let button = textField.value(forKey: "clearButton") as! UIButton
            
            if let image = button.imageView?.image {
                
                button.setImage(image.transform(withNewColor: color), for: .normal)
                
            }
            
        }
        
    }
    
    
    func setSearchImageColor(color: UIColor) {
        
        
        if let imageView = getSearchBarTextField()?.leftView as? UIImageView {
            
            imageView.image = imageView.image?.transform(withNewColor: color)
            
        }
        
    }
    
}


extension UIImage {
    
    
    func transform(withNewColor color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        
        let context = UIGraphicsGetCurrentContext()!
        
        context.translateBy(x: 0, y: size.height)
        
        context.scaleBy(x: 1.0, y: -1.0)
        
        context.setBlendMode(.normal)
        
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        context.clip(to: rect, mask: cgImage!)
        
        
        color.setFill()
        
        context.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
}
class ViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var searchBar_main: UISearchBar!
    
    @IBOutlet weak var firstScroll: UIScrollView!
    let first1 = ["image":"1"]
    let first2 = ["image":"2"]
    let first3 = ["image":"3"]
    
    
    @IBOutlet weak var secondScroll: UIScrollView!
    let second1 = ["image":"4"]
    let second2 = ["image":"5"]
    let second3 = ["image":"6"]
    
    
    @IBOutlet weak var thirdScroll: UIScrollView!
    
    let third1 = ["image":"7"]
    let third2 = ["image":"8"]
    let third3 = ["image":"9"]
    
    var firstArray = [Dictionary<String,String>]()
    var secondArray = [Dictionary<String,String>]()
    var thirdArray = [Dictionary<String,String>]()
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        first()
        second()
        third()
        init_searchBar()
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = firstScroll.contentOffset.x / firstScroll.frame.size.width
        pageControl.currentPage = Int(page)
        
        
        scrollView.contentOffset.y = 0
        
    }
    
    func init_searchBar() {
        searchBar_main.placeholder = "123123123123"
        searchBar_main.isTranslucent = true
        searchBar_main.searchBarStyle = .minimal
        searchBar_main.backgroundColor = UIColor(white:2, alpha:0)
        searchBar_main.setTextColor(color: .white)
        
        searchBar_main.layer.borderWidth = 0
        
        searchBar_main.layer.borderColor = searchBar_main.barTintColor?.cgColor //orange
        
        searchBar_main.setTextFieldColor(color: UIColor(white:2, alpha:0))
        
        searchBar_main.tintColor = .red
 
        searchBar_main.setPlaceholderTextColor(color: .white)
        
        searchBar_main.setSearchImageColor(color: .white)
        
        searchBar_main.setTextFieldClearButtonColor(color: .white)
        

    }
    
    
    
    func first() {
    
        firstArray = [first1,first2,first3]
        firstScroll.isPagingEnabled = true
        firstScroll.contentSize = CGSize(width: self.view.bounds.width * CGFloat(firstArray.count), height : 194)
        firstScroll.showsHorizontalScrollIndicator = false
        firstScroll.showsVerticalScrollIndicator = false
        //firstScroll.alwaysBounceVertical = true
        
        
        firstScroll.delegate = self
        
        for (index,firstscroll) in firstArray.enumerated() {
            //let imageView = UIImageView(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
            if let scrollView = Bundle.main.loadNibNamed("firstscroll", owner: self, options: nil)?.first as? scrollView {
                
                scrollView.Scrollimg.image = UIImage(named: firstscroll["image"]!)
                
                firstScroll.addSubview(scrollView)
                scrollView.frame.size.width = self.firstScroll.bounds.size.width
                scrollView.frame.size.height = self.firstScroll.bounds.size.height
                //scrollView.imageView?.contentMode = UIViewContentMode.scaleAspectFill
                scrollView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                
                //scrollView.contentMode = UIViewContentMode.scaleAspectFill
            }
        }
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "test")
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func second() {
        secondArray = [second1,second2,second3]
        secondScroll.isPagingEnabled = true
        secondScroll.contentSize = CGSize(width: self.view.bounds.width * CGFloat(secondArray.count), height : 194)
        secondScroll.showsHorizontalScrollIndicator = false
        secondScroll.showsVerticalScrollIndicator = false
        //firstScroll.alwaysBounceVertical = true
        
        
        secondScroll.delegate = self
        
        for (index,secondscroll) in secondArray.enumerated() {
            if let scrollView2 = Bundle.main.loadNibNamed("secondscroll", owner: self, options: nil)?.first as? scrollView2 {
                
                scrollView2.SecondImg.image = UIImage(named: secondscroll["image"]!)
                secondScroll.addSubview(scrollView2)
                
                scrollView2.SecondImg.frame.size.width = 100
                scrollView2.SecondImg.frame.size.height = 100
                
                
                scrollView2.frame.size.width = self.secondScroll.bounds.size.width
                scrollView2.frame.size.height = self.secondScroll.bounds.size.height
                
                //scrollView.imageView?.contentMode = UIViewContentMode.scaleAspectFill
                scrollView2.frame.origin.x = (CGFloat(index) * (self.view.bounds.size.width - 100) + 10)
                scrollView2.frame.origin.y = 10
                //scrollView.contentMode = UIViewContentMode.scaleAspectFill
                
                let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
                scrollView2.addGestureRecognizer(gestureRecognizer)
            }
        }
    }
    
    
    
    func third() {
        thirdArray = [third1,third2,third3]
        thirdScroll.isPagingEnabled = true
        thirdScroll.contentSize = CGSize(width: self.view.bounds.width * CGFloat(thirdArray.count), height : 194)
        thirdScroll.showsHorizontalScrollIndicator = false
        thirdScroll.showsVerticalScrollIndicator = false
        //firstScroll.alwaysBounceVertical = true
        
        
        thirdScroll.delegate = self
        
        for (index,thirdscroll) in thirdArray.enumerated() {
            if let scrollView3 = Bundle.main.loadNibNamed("third", owner: self, options: nil)?.first as? scrollView3 {
                
                scrollView3.ThirdImg.image = UIImage(named: thirdscroll["image"]!)
                thirdScroll.addSubview(scrollView3)
                scrollView3.frame.size.width = self.thirdScroll.bounds.size.width
                scrollView3.frame.size.height = self.thirdScroll.bounds.size.height
                //scrollView.imageView?.contentMode = UIViewContentMode.scaleAspectFill
                scrollView3.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                //scrollView.contentMode = UIViewContentMode.scaleAspectFill
            }
        }
    }
    
    /*
     func third() {
     thirdArray = [third1,third2,third3]
     thirdScroll.isPagingEnabled = true
     thirdScroll.contentSize = CGSize(width: self.view.bounds.width * CGFloat(thirdArray.count), height : 194)
     thirdScroll.showsHorizontalScrollIndicator = false
     thirdScroll.showsVerticalScrollIndicator = false
     //firstScroll.alwaysBounceVertical = true
     
     thirdScroll.delegate = self
     
     for (index,thirdscroll) in thirdArray.enumerated() {
     if let scrollView3 = Bundle.main.loadNibNamed("thirdscroll", owner: self, options: nil)?.first as? scrollView3 {
     
     scrollView3.ThirdImg.image = UIImage(named: thirdscroll["image"]!)
     thirdScroll.addSubview(scrollView3)
     scrollView3.frame.size.width = self.thirdScroll.bounds.size.width
     scrollView3.frame.size.height = self.thirdScroll.bounds.size.height
     //scrollView.imageView?.contentMode = UIViewContentMode.scaleAspectFill
     scrollView3.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
     //scrollView.contentMode = UIViewContentMode.scaleAspectFill
     }
     }
     }
     */
    /*func loadScroll() {
     
     for (index,firstscroll) in firstArray.enumerated() {
     if let scrollView = Bundle.main.loadNibNamed("firstscroll", owner: self, options: nil)?.first as? scrollView {
     
     scrollView.Scrollimg.image = UIImage(named: firstscroll["image"]!)
     
     firstScroll.addSubview(scrollView)
     scrollView.frame.size.width = self.firstScroll.bounds.size.width
     scrollView.frame.size.height = self.firstScroll.bounds.size.height
     //scrollView.imageView?.contentMode = UIViewContentMode.scaleAspectFill
     scrollView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
     //scrollView.contentMode = UIViewContentMode.scaleAspectFill
     }
     }
     
     
     
     }
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

