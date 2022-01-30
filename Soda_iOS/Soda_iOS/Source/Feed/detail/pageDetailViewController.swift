//
//  pageDetailViewController.swift
//  Soda_iOS
//
//  Created by 안현정 on 2022/01/29.
//

import UIKit

class pageDetailViewController: UIViewController, UIScrollViewDelegate  {

    //MARK: - OUTLET
    
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var weatherLabel : UILabel!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var myCollectionView : UICollectionView!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    //feed title Label
    
    @IBOutlet weak var LocationTitleLb : UILabel!
    @IBOutlet weak var EmotionTitleLb : UILabel!
    @IBOutlet weak var FoodTitleLb : UILabel!
    @IBOutlet weak var WhoTitleLb : UILabel!
    @IBOutlet weak var ObjectTitleLb : UILabel!
    @IBOutlet weak var ShoppingTitleLb : UILabel!
    @IBOutlet weak var LodgingTitleLb : UILabel!
    @IBOutlet weak var MemoTitleLb : UILabel!
    
    //keyword Label
    @IBOutlet weak var LocationKwLb : UILabel!
    @IBOutlet weak var EmotionKwLbLb : UILabel!
    @IBOutlet weak var FoodKwLb : UILabel!
    @IBOutlet weak var WhoKwLb : UILabel!
    @IBOutlet weak var ObjectKwLb : UILabel!
    @IBOutlet weak var ShoppingKwLb : UILabel!
    @IBOutlet weak var LodgingKwLb : UILabel!
    @IBOutlet weak var MemoKwLb : UILabel!



    var index : Int = 0
    var currentcellIndex = 0
    
    var photoImages = ["파리","파리2"]
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
        changeLabel()
        
        myScrollView.delegate = self
        pageControl.numberOfPages = photoImages.count
        pageControl.currentPage = 0
     
    }
    
    

    static func getInstance(index: Int) -> pageDetailViewController {
        let vc = UIStoryboard(name: "FeedStoryboard", bundle: nil).instantiateViewController(withIdentifier: "pageDetailViewController") as! pageDetailViewController
        
        vc.index = index
        return vc

}
    
    
    // page control
    @IBAction func pageChanged(_ sender: UIPageControl) {
        
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        myCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    
    
    //MARK: - Helpers
    
    func config() {
        self.dateLabel.text = "2022-01-29"

    }
    


    
    
    
    @objc func slideToNext()
    {
        if currentcellIndex < photoImages.count-1
        {
            currentcellIndex = currentcellIndex + 1
        }
        else
        {
            currentcellIndex = 0
        }
        pageControl.currentPage = currentcellIndex
        
        myCollectionView.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0), at: .right, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
  
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) { // 컬렉션뷰를 스크롤하면 반복적으로 호출
        let width = scrollView.bounds.size.width // 너비 저장
        let x = scrollView.contentOffset.x + (width / 2.0) // 현재 스크롤한 x좌표 저장
        
        let newPage = Int(x / width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }

    
    
}


extension pageDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoImages.count //model의 수 만큼 cell개수 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
        cell.photoImageView.image = UIImage(named: photoImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 415)
    }
}


extension pageDetailViewController  {
    
    func changeLabel() {
    guard let text = self.LocationTitleLb.text else { return }
    let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemMint , range: (text as NSString).range(of: "⦁  "))
   self.LocationTitleLb.attributedText =  attributedString
        


}

}

