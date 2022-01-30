//
//  FeedViewController.swift
//  Soda_iOS
//
//  Created by 안현정 on 2022/01/29.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var backBtn : UIButton!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var albumBtn: UIButton!
    @IBOutlet var searchTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - actions
    
    @IBAction func goToAlbum(_ sender: UIButton) {
    performSegue(withIdentifier: "goAlbumVC", sender: self)
    }
    
    //MARK: - helpers
    

    

}
