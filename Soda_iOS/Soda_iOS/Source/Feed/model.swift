//
//  model.swift
//  Soda_iOS
//
//  Created by 안현정 on 2022/01/30.
//

import Foundation

struct gallery {
    var image:String = ""
    var emoticon :String = ""
    
    init(image: String, emoticon: String){
        self.image = image
        self.emoticon = emoticon
    }
}
