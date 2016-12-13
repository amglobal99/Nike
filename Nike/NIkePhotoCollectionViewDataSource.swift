//
//  NIkePhotoCollectionViewDataSource.swift
//  Nike
//
//  Created by Jack Patil on 12/12/16.
//  Copyright © 2016 JP. All rights reserved.
//

import Foundation
import UIKit


/**
  This class should serve as the Data Source for the collection view.
   For our demo, due to time constraints, 
    we have left these methods in the ItemsViewController class.
    Ideally, that should be moved from there
 
 */


// MARK: - TODO    Chnage DataSource for Collection View to this class


class NikePhotoCollectionViewDataSource: NSObject, UICollectionViewDataSource, Utils, JsonConvertible {
    

    // MARK: - Structs
    fileprivate struct Storyboard     {
        static let CellIdentifier = "NikePhotoCollectionViewCell"
        static let showImageView = "ShowNikePhotoDetailView"
    }
    
    
    // MARK: - Data Variables
    var photos = [NikePhoto]()   // This is the list of all our Photos
    var sections:[String] = [""]  // This is the array of names for our  sections
    var sectionPhotoItems:[String:[NikePhoto]] = [:]  // Dictionary holds Photos for each section title
    
    
    
    
    // MARK: - DataSource methods
    
    
    /**
     Returns the number of sections to be used in the CollectionView
     - Parameter collectionView:   The CollectionView being used
     - Returns: An Integer showing how many sections
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    
    /**
     Returns the number of Items in each section
     
     - Parameter collectionView: The CollectionView being processed
     - Parameter section: The section being worked on
     - Returns: An integer showing the number of items to be displayed in each section
     
     */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // let itemsInSection = photosForSection(section)
       //  return itemsInSection.count
        return 1
    }  // end func
    
    
    
    
    // Function to get a Cell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! NikePhotoCollectionViewCell
        return cell
    } //end method
    
    
    
    
} // end class





