//
//  MyViewController.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/30.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var labelLogout: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(getter: labelLogout))
        labelLogout.isUserInteractionEnabled = true
        labelLogout.addGestureRecognizer(tap)
    }

    @objc func tapLogoutGesture(sender: UITapGestureRecognizer) {
        print("hi")
//        UserDefaults.standard.set("", forKey: "jwt")
//        JwtToken.token = ""
//
//        let mainTabBarController = UIStoryboard(name: "LoginStoryboard", bundle: nil).instantiateViewController(identifier: "loginStoryboard")
//        self.changeRootViewController(mainTabBarController)
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
