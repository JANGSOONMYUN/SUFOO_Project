//
//  ViewController.swift
//  SUFOOver0.3
//
//  Created by Admin on 24/02/2018.
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
class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var searchBar_main: UISearchBar!
    @IBOutlet weak var scrollFirst: UIScrollView!
    
    @IBOutlet weak var hash_main1: UILabel!
    @IBOutlet weak var hash_main2: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    let first1 = ["image":"1"]
    let first2 = ["image":"2"]
    let first3 = ["image":"3"]
    @IBOutlet weak var scrollSecond: UIScrollView!
    
    let second1 = ["image":"4"]
    let second2 = ["image":"5"]
    let second3 = ["image":"6"]
    
    @IBOutlet weak var scrollThird: UIScrollView!
    
    let third1 = ["image":"7"]
    let third2 = ["image":"8"]
    let third3 = ["image":"9"]
    
    var firstArray = [Dictionary<String,String>]()
    var secondArray = [Dictionary<String,String>]()
    var thirdArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first()
        second()
        third()
        init_searchBar()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = scrollFirst.contentOffset.x / scrollFirst.frame.size.width
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
        scrollFirst.isPagingEnabled = true
        scrollFirst.contentSize = CGSize(width: self.view.bounds.width * CGFloat(firstArray.count), height : 194)
        scrollFirst.showsHorizontalScrollIndicator = false
        scrollFirst.showsVerticalScrollIndicator = false
        //firstScroll.alwaysBounceVertical = true
        
        
        scrollFirst.delegate = self
        
        for (index,Scroll) in firstArray.enumerated() {
            //let imageView = UIImageView(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
            if let scrollView = Bundle.main.loadNibNamed("Scroll", owner: self, options: nil)?.first as? scrollView {
                
                scrollView.Scrollimg.image = UIImage(named: Scroll["image"]!)
                
                scrollFirst.addSubview(scrollView)
                scrollView.frame.size.width = self.scrollFirst.bounds.size.width
                scrollView.frame.size.height = self.scrollFirst.bounds.size.height
                //scrollView.imageView?.contentMode = UIViewContentMode.scaleAspectFill
                scrollView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                
                //scrollView.contentMode = UIViewContentMode.scaleAspectFill
            }
        }
    }
    
    func second() {
        
        secondArray = [second1,second2,second3]
        scrollSecond.isPagingEnabled = true
        scrollSecond.contentSize = CGSize(width: self.view.bounds.width * CGFloat(secondArray.count), height : 194)
        scrollSecond.showsHorizontalScrollIndicator = false
        scrollSecond.showsVerticalScrollIndicator = false

        
        scrollSecond.delegate = self
        
        for (index,Scroll) in secondArray.enumerated() {
            if let scrollView = Bundle.main.loadNibNamed("Scroll", owner: self, options: nil)?.first as? scrollView {
                
                scrollView.Scrollimg2.image = UIImage(named: Scroll["image"]!)
                
                scrollSecond.addSubview(scrollView)
                scrollView.frame.size.width = self.scrollSecond.bounds.size.width
                scrollView.frame.size.height = self.scrollSecond.bounds.size.height
                //scrollView.imageView?.contentMode = UIViewContentMode.scaleAspectFill
                scrollView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                
                //scrollView.contentMode = UIViewContentMode.scaleAspectFill
            }
        }
    }
    
    func third() {
        
        thirdArray = [third1,third2,third3]
        scrollThird.isPagingEnabled = true
        scrollThird.contentSize = CGSize(width: self.view.bounds.width * CGFloat(thirdArray.count), height : 194)
        scrollThird.showsHorizontalScrollIndicator = false
        scrollThird.showsVerticalScrollIndicator = false
        //firstScroll.alwaysBounceVertical = true
        
        
        scrollThird.delegate = self
        
        for (index,Scroll) in thirdArray.enumerated() {
            //let imageView = UIImageView(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
            if let scrollView = Bundle.main.loadNibNamed("Scroll", owner: self, options: nil)?.first as? scrollView {
                
                scrollView.Scrollimg3.image = UIImage(named: Scroll["image"]!)
                
                scrollThird.addSubview(scrollView)
                scrollView.frame.size.width = self.scrollThird.bounds.size.width
                scrollView.frame.size.height = self.scrollThird.bounds.size.height
                //scrollView.imageView?.contentMode = UIViewContentMode.scaleAspectFill
                scrollView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                
                //scrollView.contentMode = UIViewContentMode.scaleAspectFill
            }
        }
    }
}

