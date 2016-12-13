//
//  NikePhotoCollectionViewCell.swift
//  Nike
//
//  Created by Jack Patil on 12/12/16.
//  Copyright © 2016 JP. All rights reserved.
//

import Foundation
import UIKit



protocol NikePhotoCollectionViewCellDelegate
{
    
}



class NikePhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    
    
    func updateWithImage(_ image: UIImage?) {
        if let imageToDisplay = image {
            spinner .stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner .startAnimating()
            imageView.image = nil
        }
    }  //end method
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateWithImage(nil )
    }
    
    
    
    
    // called when cell is being reused
    override func prepareForReuse() {
        //print("             super.prepareforReuse")
        super.prepareForReuse()
        updateWithImage(nil )
    }
    
    
    
    
} // end class
