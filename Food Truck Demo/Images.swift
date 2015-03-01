//
//  Images.swift
//  foodtruck-ios
//
//  Created by Shaobo Sun on 2/28/15.
//  Copyright (c) 2015 Shaobo Sun. All rights reserved.
//

import UIKit

struct Images {
    
    static var truckImages = [String:Image]()
    
}

struct Image {
//    var imagePath : String = ""
    var image : UIImage
    //var truckId: String = ""
    
    init(image : UIImage) {
        //self.truckId = truckId
        self.image = image
    }
}