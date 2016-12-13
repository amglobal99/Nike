//
//  PhotoStore.swift
//  Nike
//
//  Created by Jack Patil on 12/13/16.
//  Copyright © 2016 JP. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire



/**
 
 Class acts as a store and processes all requests for Photos
 
 */


class PhotoStore {
    
    
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
    
    
    
    /**
        Function to retrieve array of NikePhoto objects
    
        - parameter json:  A SwiftyJSON object from which to retrieve array of Photos
        - returns :  a Result object that could contain array of Photos if success, or an error on failure
 
     */
    
    
    func photosFromJsonObject(_ json:JSON) -> NikePhotosResult {
        
        print("Step1 ...")
        
        var finalPhotos:[NikePhoto] = []
        var addCount = 0
        // print("      json object count is : \(json.count)   ")
        
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
        guard
        let name = json["name1"].string,
        let price = json[0]["prices"]["sale"].string,
        let color = json["colorCode"].string,
        let photoUrl1 = json[0]["images"][0]["path"].string,
        let photoUrl2 = json[0]["images"][1]["path"].string,
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
    
    

    
    
    
    
    
    
    
    
    
} // end class
