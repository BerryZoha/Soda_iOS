//
//  FeedPageViewController.swift
//  Soda_iOS
//
//  Created by 안현정 on 2022/01/29.
//

import UIKit
import Kingfisher



class FeedPageViewController: UIPageViewController {

    var individualPageViewControllerList = [UIViewController]()
    
   // var pageDetailVC : pageDetailViewController?
    
    var diarys : [Diary] = []

                       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.dataSource = self
        self.delegate = self

        individualPageViewControllerList = [
            pageDetailViewController.getInstance(index: 0),
            pageDetailViewController.getInstance(index: 1),
            pageDetailViewController.getInstance(index: 2),
            pageDetailViewController.getInstance(index: 3)
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
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            //페이징 킷 뷰컨트롤러의 첫번째 인덱스 ( 페이징 넘기면서 첫번째 인덱스의 뷰가 사라지고 두번째 페이징이 첫번째 인덱스가 됨)
            let index = individualPageViewControllerList.firstIndex(of: pageViewController.viewControllers![0])

            //만약에 페이징뷰컨트롤러의 0번째 인덱스가 currentviewcontroller라면?
            
            if let currentViewController = pageViewController.viewControllers?[0] as? pageDetailViewController {
                
                //currentviewcontroller = pageDetailViewController()
                currentViewController.diarys = diarys[index].imageUrls
                
               //
                currentViewController.test = 1
                currentViewController.myCollectionView.reloadData()
            }
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0 
    }
    
    
}

