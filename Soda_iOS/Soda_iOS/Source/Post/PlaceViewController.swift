//
//  PlaceViewController.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/30.
//

import UIKit

import GooglePlaces
import UIKit

class PlaceViewController: UIViewController {

  private var tableView: UITableView!
  private var tableDataSource: GMSAutocompleteTableDataSource!
    var placeName = ""

  override func viewDidLoad() {
    super.viewDidLoad()

    let searchBar = UISearchBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 44.0))
    searchBar.delegate = self
    view.addSubview(searchBar)

    tableDataSource = GMSAutocompleteTableDataSource()
    tableDataSource.delegate = self

    tableView = UITableView(frame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height - 44))
    tableView.delegate = tableDataSource
    tableView.dataSource = tableDataSource

    view.addSubview(tableView)
  }
}

extension PlaceViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    // Update the GMSAutocompleteTableDataSource with the search text.
    tableDataSource.sourceTextHasChanged(searchText)
  }
}

extension PlaceViewController: GMSAutocompleteTableDataSourceDelegate {
  func didUpdateAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
    // Turn the network activity indicator off.
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
    // Reload table data.
    tableView.reloadData()
  }

  func didRequestAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
    // Turn the network activity indicator on.
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    // Reload table data.
    tableView.reloadData()
  }

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didAutocompleteWith place: GMSPlace) {
    // Do something with the selected place.
    print("Place name: \(place.name)")
      placeName = "\(place.name)"
    print("Place address: \(place.formattedAddress)")
    print("Place attributions: \(place.attributions)")
  }

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didFailAutocompleteWithError error: Error) {
    // Handle the error.
    print("Error: \(error.localizedDescription)")
  }

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didSelect prediction: GMSAutocompletePrediction) -> Bool { //클릭했을때
      let storyboardVC = UIStoryboard(name: "PostStoryboard", bundle: nil).instantiateViewController(withIdentifier: "postVC") as! PostViewController

      storyboardVC.text = placeName
      dismiss(animated: true, completion: nil)
    return true
  }
}
