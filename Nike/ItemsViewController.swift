//
//  ItemsViewController.swift
//  Nike
//
//  Created by Jack Patil on 12/12/16.
//  Copyright © 2016 JP. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON




class ItemsViewController: UICollectionViewController, NikePhotoCollectionViewCellDelegate {
    
    
    // MARK: - Structs
    fileprivate struct Storyboard     {
        static let CellIdentifier = "NikePhotoCollectionViewCell"
        static let showImageView = "ShowNikePhotoDetailView"
    }
    
    
    // MARK: - Data Variables
    var photos = [NikePhoto]()   // This is the list of all our Photos
    var sections:[String] = [""]  // This is the array of names for our  sections
    var sectionPhotoItems:[String:[NikePhoto]] = [:]  // Dictionary holds Photos for each section title
    
    
    
    override func viewDidLoad() {
        print("tets")
        
        // retrieve collection of Photos
        
        if let path = Bundle.main.path(forResource: "productList", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    print("jsonData:\(jsonObj)")
                    
                    print("++++++++++++++++++++++ filter+++++++++")
                    let prodObj = jsonObj["results"][0]["products"]
                    print(prodObj)
                    print("Length is : \(prodObj.count)  ")
                    
                    
                    
                    
                    
                    
                    
                    
                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        
        
        
        
        
    } // end method
    
    
    
    
    
    
    
    
    
    // MARK: - DataSource methods
    
    
    /**
     Returns the number of sections to be used in the CollectionView
     - Parameter collectionView:   The CollectionView being used
     - Returns: An Integer showing how many sections
     */
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    
    /**
     Returns the number of Items in each section
     
     - Parameter collectionView: The CollectionView being processed
     - Parameter section: The section being worked on
     - Returns: An integer showing the number of items to be displayed in each section
     
     */
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // let itemsInSection = photosForSection(section)
        // return itemsInSection.count
        return 1
        
    }  // end func
    
    
    
    
    // Function to get a Cell
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! NikePhotoCollectionViewCell
        
        /*
         let photo = photoForItemAtIndexPath(indexPath: indexPath)
         
         cell.photoIDLabel.text = photo.photoID
         cell.photoServerLabel.text = photoTitleToDisplay
         
         
         
         cell.updateWithImage(photo.image)
         */
        
        
        
        return cell
    } //end method
    
    
    
    
    
    
}  // end class
