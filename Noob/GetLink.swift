//
//  GetLink.swift
//  Noob
//
//  Created by ios27 on 3/20/15.
//  Copyright (c) 2015 ios27. All rights reserved.
//

import Foundation
class CrawlMachine {
    var sessionConnection: NSURLSession
    var ImageArray: [UnsplashImage]!
    
    init() {
        sessionConnection = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    }
    
    func StartCrawl() {
        
    }
}