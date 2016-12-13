//
//  ProtocolUtils.swift
//  Nike
//
//  Created by Jack Patil on 12/12/16.
//  Copyright © 2016 JP. All rights reserved.
//


import Foundation
import UIKit
import Alamofire



// MARK: Protocols

protocol Utils {}   // This protocol contains common utility functions



// MARK: - Extensions Utils

extension Utils {
    

    
    
    // MARK:  URL Related
    
    
    func getSiteURL(baseURLString:String, method: String?, parameters: [String:String]?, apiKey:String? ) -> URL {
        var components = URLComponents(string: baseURLString )!
        // check if we need to use mehod and apiKey
        if method != nil && apiKey != nil {
            var queryItems = [URLQueryItem]()
            let baseParams  = [
                "method": method,
                "format": "json",
                "nojsoncallback": "1",
                "api_key": apiKey
            ]
            
            for(key,value) in baseParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
            if let additionalParams = parameters {   // make sure parameters is not nil
                for (key, value) in additionalParams {
                    let item = URLQueryItem(name: key, value: value )
                    queryItems.append(item)
                } //end for loop
            } //end if
            
            components.queryItems = queryItems
        } // if method != nil
        
        return components.url!
        
    } //end method
    
    
    
    
    
    
    
    
    
    
    
}  // end extension



















