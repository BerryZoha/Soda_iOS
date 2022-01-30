//
//  FeedPageViewController.swift
//  Soda_iOS
//
//  Created by 안현정 on 2022/01/29.
//

import UIKit

class FeedPageViewController: UIPageViewController {

    
    var individualPageViewControllerList = [UIViewController]()
                       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self

        individualPageViewControllerList = [
            pageDetailViewController.getInstance(index: 0),
            pageDetailViewController.getInstance(index: 1),
            pageDetailViewController.getInstance(index: 2),
            pageDetailViewController.getInstance(index: 3),
            pageDetailViewController.getInstance(index: 4),
        ]
        
        setViewControllers([individualPageViewControllerList[0]], direction: .forward, animated: true, completion: nil)
        
    }
    
}

extension FeedPageViewController :  UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let indexOfCurrentPageVC = individualPageViewControllerList.firstIndex(of: viewController)!
        
        if indexOfCurrentPageVC == 0 {
            return nil
        } else {
            return individualPageViewControllerList[indexOfCurrentPageVC - 1]
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndexOfPageVC = individualPageViewControllerList.firstIndex(of: viewController)!
        
        if currentIndexOfPageVC == individualPageViewControllerList.count - 1 {
            return nil
        } else {
            return individualPageViewControllerList[currentIndexOfPageVC + 1]
        }
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0 
    }
    
    
}

