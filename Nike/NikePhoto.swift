//
//  NikePhoto.swift
//  Nike
//
//  Created by Jack Patil on 12/12/16.
//  Copyright © 2016 JP. All rights reserved.
//

import Foundation
import UIKit




class NikePhoto {
    
    let name: String
    let price: String
    let color: String
    let remoteURLThumb: URL
    let remoteURLFull: URL
    var image: UIImage?
   
    
    init(name: String, price: String, color:String, remoteURLThumb: URL, remoteURLFull: URL) {
        self.name = name
        self.price = price
        self.color = color
        self.remoteURLThumb = remoteURLThumb
        self.remoteURLFull = remoteURLFull
        //self.image = image
    }
    
    
    
}  //end class




extension NikePhoto: Equatable {}


func == (lhs:NikePhoto, rhs: NikePhoto) -> Bool  {
    return lhs.name == rhs.name
}




