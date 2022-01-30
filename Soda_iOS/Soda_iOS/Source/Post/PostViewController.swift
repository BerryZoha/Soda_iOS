//
//  PostViewController.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/30.
//

import UIKit

class PostViewController: UIViewController {

//    @IBOutlet weak var tvHappy: UILabel!
    @IBOutlet weak var tfPlace: UITextField!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 눌렀을때 뒤에 동그란 배경이 그려지는 부부
//        tvHappy.layer.backgroundColor = UIColor.mint.cgColor
//        tvHappy.layer.cornerRadius = tvHappy.frame.height / 2.5
//        tvHappy.layer.masksToBounds = true
//        tfPlace.text = text
        let lookAroundTapped = UITapGestureRecognizer(target: self, action: #selector(touchTfPlace))
        tfPlace.addGestureRecognizer(lookAroundTapped)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @objc func touchTfPlace(sender: UITapGestureRecognizer){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "placeVC") else {return}
        self.present(vc, animated: true, completion: nil)
//        print("hello")
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
