//
//  ItemsViewControllerTests.swift
//  Nike
//
//  Created by Jack Patil on 12/13/16.
//  Copyright © 2016 JP. All rights reserved.
//

import XCTest
import SwiftyJSON




/**
 
 This class contains tests for the ItemsViewController class ( ItemsViewController.swift)
 

 */




class ItemsViewControllerTests: XCTestCase {
    
    
    var itemsVC: ItemsViewController!
    var window: UIWindow!
    
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "NikePhotos", bundle: bundle)
        let itemsVC = storyboard.instantiateViewController(withIdentifier: "NikePhotos")  as! ItemsViewController
        addViewToWindow()
    }
    
    
    func addViewToWindow()   {
        window.addSubview(itemsVC.view)
        RunLoop.current.run(until: Date())
    }
    
    
    
    
  // MARK: - Test Methods
    
    func testThatLocalJSONFileIsAvailable() {
        if let path = Bundle.main.path(forResource: "productList", ofType: "json") {
            XCTAssertNotNil(path)
        }
    }
    
    
    
    
    func testThatJSONFileContainsValidData() {
        var jsonObj: JSON?
        if let path = Bundle.main.path(forResource: "productList", ofType: "json") {
            do {
                // Retrieve JSON from the provided local file
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                jsonObj = JSON(data: data)
            } catch {
                jsonObj = nil
            }
        } else {
            jsonObj = nil
        }
        
         XCTAssertNotNil(jsonObj)
        
    } // end function
    

    
    

    
    
    
}
