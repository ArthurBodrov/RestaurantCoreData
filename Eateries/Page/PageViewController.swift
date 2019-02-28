////
////  PageViewController.swift
////  Eateries
////
////  Created by Arthur on 14.02.2019.
////  Copyright © 2019 Arthur. All rights reserved.
////
//
//import UIKit
//
//class PageViewController: UIPageViewController {
//    
//    var headerArray = ["Записывайте","Находите"]
//    var subheaderArray = ["Создайте список ваших любимых ресторанов","Найдите и отметьте на карте ваши любимые рестораны"]
//    var imageArray = ["food","iphoneMap"]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        dataSource = self
//        if let firstVS = dispayViewController(atIndex: 0){
//            setViewControllers([firstVS], direction: .forward, animated: true, completion: nil)
//        }
//    }
//    
//    
//    func dispayViewController (atIndex index: Int) -> ContentViewController? {
//        guard index >= 0 else { return nil }
//        guard index < headerArray.count else { return nil }
//        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController else { return nil }
//        contentVC.header = headerArray[index]
//        contentVC.subheader = subheaderArray[index]
//        contentVC.imageFile = imageArray[index]
//        contentVC.index = index
//        return contentVC
//    }
//    func nextVC(atIndex index: Int){
//        if let contentVC = dispayViewController(atIndex: index + 1){
//            setViewControllers([contentVC], direction: .forward, animated: true, completion: nil)
//            
//        }
//    }
//    
//}
//extension PageViewController: UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        var index = (viewController as! ContentViewController).index
//        index -= 1
//        return dispayViewController(atIndex: index)
//    }
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        var index = (viewController as! ContentViewController).index
//        index += 1
//        return dispayViewController(atIndex: index)
//    }
////    func presentationCount(for pageViewController: UIPageViewController) -> Int {
////        return headerArray.count
////    }
////    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
////        let contentVC = storyboard?.instantiateViewController(withIdentifier: "content ViewController") as? ContentViewController
////        return contentVC!.index
////    }
//}
