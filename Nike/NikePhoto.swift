//
//  NikePhoto.swift
//  Nike
//
//  Created by Dad on 12/12/16.
//  Copyright © 2016 JP. All rights reserved.
//

import Foundation
import UIKit




class NikePhoto {
    
    let name: String
    let price: String
    let color: String
    let remoteURL: URL
    var image: UIImage?
   
    
    init(name: String, price: String, color:String, remoteURL: URL) {
        self.name = name
        self.price = price
        self.color = color
        self.remoteURL = remoteURL
        //self.image = image
    }
    
    
    
}  //end class




extension NikePhoto: Equatable {}


func == (lhs:NikePhoto, rhs: NikePhoto) -> Bool  {
    return lhs.name == rhs.name
}




