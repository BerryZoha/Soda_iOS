//
//  HomeViewController.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/29.
//

import UIKit


private let cellID = "HomeCollectionViewCell"

class HomeViewController: UIViewController {
    
    var height:CGFloat = 0.0
    var width:CGFloat = 0.0

    @IBOutlet weak var homeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        height = view.frame.size.height
        width = view.frame.size.width
        // Do any additional setup after loading the view.
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        homeCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: "homeCell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //기기 사이즈 대응
        // in case you you want the cell to be 40% of your controllers view
        return CGSize(width: collectionView.frame.size.width/2-6, height: height*0.35)
    }
}
