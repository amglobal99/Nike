//
//  BaseTestCase.swift
//  Nike
//
//  Created by Dad on 12/13/16.
//  Copyright © 2016 JP. All rights reserved.
//



import Foundation
import Alamofire
import XCTest

@testable import Nike



class BaseTestCase: XCTestCase, JsonConvertible {
    

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
    
    
    
    func url(forResource fileName: String, withExtension ext: String) -> URL {
        let bundle = Bundle(for: BaseTestCase.self)
        return bundle.url(forResource: fileName, withExtension: ext)!
    }
    
    
    
    
}
