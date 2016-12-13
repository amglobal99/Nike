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
import Alamofire





class ItemsViewController: UICollectionViewController, NikePhotoCollectionViewCellDelegate {
    
    
    // MARK: - Enums
    
    enum ImageResult {
        case success(UIImage)
        case failure(Error)
    }
    
    enum PhotoError: Error {
        case imageCreationError
    }
    
    
    enum NikePhotosResult {
        case success([NikePhoto] )
        case failure(Error)
    }
    
    enum NikeError: Error {
        case invalidJSONData
    }
    
    enum PhotosResult {
        case success([NikePhoto] )
        case failure(Error)
    }
    
    
    
    
    // MARK: - Local Variables
    let session = Constants.Configuration.session
    var jsonResultObject:JSON?
    
    
    
    // MARK: - Structs
    fileprivate struct Storyboard     {
        static let CellIdentifier = "NikePhotoCollectionViewCell"
        static let showImageView = "ShowNikePhotoDetailView"
    }
    
    
    // MARK: - Data Variables
    var photos = [NikePhoto]()   // This is the list of all our Photos
    var sections:[String] = [""]  // This is the array of names for our  sections
    // Create a PhotoStore object. Ideally, set this value using property injection
    //weak var store = PhotoStore()
    
    
    
    
    
    override func viewDidLoad() {
        // Retrieve collection of Photos.
        // Some of the code here should be moved to separate functions.
        // Due to time constraints, we are taking some shortcuts for this demo
        
        if let path = Bundle.main.path(forResource: "productList", ofType: "json") {
            
            do {
                // Retrieve JSON from the provided local file
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    print("jsonData:\(jsonObj)")
                    
                    // Get the Product details from the JSON object
                    let prodObj = jsonObj["results"][0]["products"]
                    
                    
                    
                    // MARK: - TODO  Complete code to retrieve Photo details and Image
                    /**
                        Due to time constrains, leaving this as a TODO
                        Functions to be used here are in place.
                     
                        Logic is as follows:
                        - First, retrieve array of Photos to b eprocessed
                        - CollectionView Delegate method with then search for Photo at that Index
                        - Retrieve UIImage using URL path 
                        - Populate values in CollectionView cell
                        - Stop Spinner and replace cell with Phtoto image
                     
                     
 
                        */
                    
                    
                    // Get list of Photos(returns array of 'NikePhoto' items)
                    //let itemsResult   = photosFromJsonObject(prodObj)
                    
                    
                    
                    
                    
                    
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
        
        // MARK: - TODO Complete code to make value dynamic
        
        // let itemsInSection = photosForSection(section)
        // return itemsInSection.count
        return 1
        
    }  // end func
    
    
    
    
    // Function to get a Cell
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! NikePhotoCollectionViewCell
        
        
        
        // INserting Dummy data here to get Display working.
        cell.nameLabel.text = "Mens Running Shorts"
        cell.priceLabel.text = "4.99"
        cell.colorLabel.text = "939"
        
        
        
        //MARK: - TODO Complete code to populate values from Photo
        
        /*
         let photo = photoForItemAtIndexPath(indexPath: indexPath)
         cell.nameLabel.text = photo.name
         cell.priceLabel.text = photo.price
         cell.colorLabel.text = photo.color
         cell.updateWithImage(photo.image)
         */
        
        
        
        return cell
    } //end method
    
    
    
    
    
    
    
    
    //MARK: - PhotoStore Methods
    
    
    
    /**
     Function to retrieve array of NikePhoto objects
     
     - parameter json:  A SwiftyJSON object from which to retrieve array of Photos
     - returns :  a Result object that could contain array of Photos if success, or an error on failure
     
     */
    
    
    func photosFromJsonObject(_ json:JSON) -> NikePhotosResult {
        
        print("Step1 ...")
        
        var finalPhotos:[NikePhoto] = []
        var addCount = 0
        print("      json object count is : \(json.count)   ")
        
        print("***************** JSON Object *********************")
        print(json)
        print("***************** end JSOn object *****************")
        
        for ( _, jsonItem) in json {
            if let photo: NikePhoto  = photoFromJSONObject(jsonItem) {
                finalPhotos.append(photo)
                addCount += 1
            }
        }
        
        if finalPhotos.count == 0 && json.count > 0 {
            print("Sorry...No photos were retrieved")
            return  NikePhotosResult.failure(NikeError.invalidJSONData)
        }
        
        print("       ++++++++++++  Final Photos +++++++++++++++++")
        print("      Array contains \(finalPhotos.count)  photos" )
        
        return NikePhotosResult.success(finalPhotos)
    }  // end func
    
    
    
    
    
    
    
    /**
     Function to retrieve individual Photo object
     - parameter json: a SwiftyJSON object
     - returns: a single Photo object
     
     */
    
    
    func photoFromJSONObject(_ json: JSON ) -> NikePhoto? {
        print("Starting photoFromJSOnObject")
        guard
            let name = json["name1"].string,
            let color = json["colorCode"].string,
            let price = json["prices"]["sale"].string,
            let photoUrl1 = json["images"][0]["path"].string,
            let photoUrl2 = json["images"][1]["path"].string,
            let url1 = URL(string: photoUrl1),
            let url2 = URL(string: photoUrl2)
            else {
                return nil    // don't have enough info, print("returing nil here" )
        }
        return NikePhoto(name: name, price: price, color: color, remoteURLThumb: url1, remoteURLFull: url2)
    }  //end method
    
    
    
    
    
    
    
    
    
    
    
    
    /**
     Function to fetch image for Photo using URL provided in the JSON data element
     - parameter photo: a NikePhoto object ( individual Photo )
     - returns: a UIImage object
     
     */
    func fetchImageForPhoto(_ photo: NikePhoto, completion: @escaping (ImageResult) -> Void ) {
        
        //print("          fetchImageForPhoto: Started for \(photo.photoID) ")
        if let image = photo.image {
            completion(.success(image) )
            return
        }
        let photoURL = photo.remoteURLFull
        let request = URLRequest(url: photoURL as URL)
        
        // Make Alamofire Request
        Alamofire.request(request).response
            { (response) -> Void  in
                guard response.error  == nil else {   // got an error
                    print(response.error!)
                    return
                }
                guard response.data != nil else {
                    return
                }
                let result: ImageResult = (self.processImageRequest(data: response.data, error: response.error as NSError?))
                
                if case let ImageResult.success(image) = result {
                    photo.image = image
                    // print("          fetchImageForPhoto: image obtained successfully for \(photo.photoID)" )
                }
                
                completion(result)
        }  // end closure
        
        
    } //end method
    
    
    
    
    /**
     Function to retrieve a single Photo image
     
     */
    func processImageRequest(data: Data?, error: NSError?) -> ImageResult {
        
        guard let  imageData = data,  let image = UIImage(data: imageData)   else {
            //could not get image
            if data == nil {
                return ImageResult.failure(error!)
            } else {
                return ImageResult.failure(PhotoError.imageCreationError)
            }
        }
        return .success(image )
    } //end method
    
    
    
    
    
    

    
    
    
    
    
}  // end class
