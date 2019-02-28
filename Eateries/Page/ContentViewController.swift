////
////  ContentViewController.swift
////  Eateries
////
////  Created by Arthur on 14.02.2019.
////  Copyright © 2019 Arthur. All rights reserved.
////
//
//import UIKit
//
//class ContentViewController: UIViewController {
//
//    @IBOutlet weak var headerLabel: UILabel!
//    @IBOutlet weak var subheaderLabel: UILabel!
//    
//    @IBOutlet weak var imageView: UIImageView!
//    
//    @IBOutlet weak var pageButton: UIButton!
//    @IBOutlet weak var pageControl: UIPageControl!
//    var header = ""
//    var subheader = ""
//    var imageFile = ""
//    var index = 0
//    
//    
//    @IBAction func pageButtonPressed(_ sender: UIButton) {
//        switch index {
//        case 0:
//            let pageVC = parent as! PageViewController
//            pageVC.nextVC(atIndex: index)
//        case 1:
//            dismiss(animated: true, completion: nil)
//        default:
//            break
//        }
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        pageButton.layer.cornerRadius = 15
//        pageButton.clipsToBounds = true
//        pageButton.layer.borderWidth = 2
//        pageButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//        pageButton.layer.borderColor = (#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)).cgColor
//        
//        switch index {
//        case 0: pageButton.setTitle( "Дальше", for: .normal)
//        case 1: pageButton.setTitle( "Открыть", for: .normal)
//        default:
//            break
//        }
//        
//        headerLabel.text = header
//        subheaderLabel.text = subheader
//        imageView.image = UIImage(named: imageFile)
//        pageControl.numberOfPages = 2
//        pageControl.currentPage = index
//        
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
