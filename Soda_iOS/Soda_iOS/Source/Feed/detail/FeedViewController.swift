//
//  FeedViewController.swift
//  Soda_iOS
//
//  Created by 안현정 on 2022/01/29.
//

import UIKit

extension FeedViewController {
    func successData(_ result : FeedResponse) {
        nameLabel.text = result.result.categoryName
    }
}


class FeedViewController: UIViewController {
    
    @IBOutlet weak var backBtn : UIButton!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var albumBtn: UIButton!
    @IBOutlet var searchTextField: UITextField!

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        FeedTitleRequest().FeedData(Idx: 1, Type: "feed" , self)
        
    }
    
    //MARK: - actions
    
    @IBAction func goToAlbum(_ sender: UIButton) {
    performSegue(withIdentifier: "goAlbumVC", sender: self)
    }
    
    //MARK: - helpers
    

    

}
