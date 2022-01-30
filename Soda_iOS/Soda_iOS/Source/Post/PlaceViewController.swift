//
//  PlaceViewController.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/30.
//

import UIKit

class PlaceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didAutocompleteWith place: GMSPlace) {
    // Do something with the selected place.
    print("Place name: \(place.name)")
      placeName = "\(place.name)"
    print("Place address: \(place.formattedAddress)")
    print("Place attributions: \(place.attributions)")
      
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

      storyboardVC.text = placeName
      dismiss(animated: true, completion: nil)
      
    return true
  }
}
