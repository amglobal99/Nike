//
//  NIkePhotoCollectionViewDataSource.swift
//  Nike
//
//  Created by Dad on 12/12/16.
//  Copyright © 2016 JP. All rights reserved.
//

import Foundation
import UIKit


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
        
        /*
        let photo = photoForItemAtIndexPath(indexPath: indexPath)
        
        cell.photoIDLabel.text = photo.photoID
        cell.photoServerLabel.text = photoTitleToDisplay
        
        
        
        cell.updateWithImage(photo.image)
        */
        
        
        
        return cell
    } //end method
    
    
    
    
    
    // Function to get Section Header View
    //
    
    
    /*
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView{
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "NinthPhotoSectionHeader",
                                                                         for: indexPath) as! NinthPhotoSectionHeaderView
        
        let rowNumber = (indexPath as IndexPath).row
        let sectionNumber = (indexPath as IndexPath).section
        print( "HEADER: Row is : \(rowNumber) and Section is: \(sectionNumber) ")
        let sectionLabel = sections[sectionNumber]  // Retrieve section title from our stored array
        print("Our section label is : \(sectionLabel) " )
        let title = "Section :: " + sectionLabel
        headerView.sectionLabel.text = title
        
        return headerView
        
    }  // end method
    */
    
    
    
    
    
    
    
    // MARK: - Index Related Methods
    
    // Function returns the number of Items in section
    //
    
    /*
    func photosForSection(_ sectionNumber: Int) -> [NikePhoto] {
        // Get photos for this section (Filter the photos array)
        
        
        let sectionPhotos = photos.filter{
            $0.datetakenUnknown == String(sectionNumber)
            
        }
        
        
        /*
         for i in sectionPhotos{
         print("Section: \(sectionNumber) ----> Id: \(i.photoID)  ")
         }
         */
        return sectionPhotos
    }
    
    */
    
    
    
    /*
    
    // Function returns a Photo for the given indexpath
    func photoForItemAtIndexPath(indexPath: IndexPath) -> NikePhoto {
        let rowNumber = (indexPath as IndexPath).row
        let sectionNumber = (indexPath as IndexPath).section
        //print( "Func  Row is : \(rowNumber) and Section is: \(sectionNumber) ")
        // get the Photos in this particular section
        
        /*
        let sectionPhotos = photosForSection(sectionNumber)
        // get the Photo to process
        let photo = sectionPhotos[rowNumber]
        */
        
        
        let photo = sectionPhotos[rowNumber]
        return photo
    } // end func
    
    
    */
    
    
    
    
    
    
    
} // end class





