//
//  AlbumViewController.swift
//  Soda_iOS
//
//  Created by 안현정 on 2022/01/30.
//

import UIKit

class AlbumViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {


    private var galleries : [gallery] = [ gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰"),
                                       gallery(image: "갤러리", emoticon: "🥰")]
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

    
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // 옆 간격
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return galleries.count
        }
    
    
    

        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        
            
            let gallery = galleries[indexPath.row]
            cell.AlbumImageView.image = UIImage(named: gallery.image)
            cell.emoticonLabel.text = gallery.emoticon
        
            return cell
        }

}
