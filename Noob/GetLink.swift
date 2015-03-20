//
//  GetLink.swift
//  Noob
//
//  Created by ios27 on 3/20/15.
//  Copyright (c) 2015 ios27. All rights reserved.
//
enum MachineStatus {
    case Working
    case Pause
    case Stop
}

import Foundation
class CrawlMachine {
    var sessionConnection: NSURLSession
    var ImageArray: [UnsplashImage]!
    var status = MachineStatus.Stop
    var page = 1
    let Baselink = "https://unsplash.com/grid/filter?_=page%3D3&page="
    init() {
        sessionConnection = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    }
    
    func startCrawl() {
        var link = Baselink + "\(page)"
        var url = NSURL(string: link)
        let crawlTask = sessionConnection.dataTaskWithURL(url!, completionHandler: {
            (data,res,err) -> Void in
            if (err === nil) {
             self.AnalysisProcess(data)
            } else {
                println(err);
            }
        })
        crawlTask.resume();
    }
    private func AnalysisProcess(data: NSData){
        var err : NSError?
        let option = CInt(HTML_PARSE_NOERROR.value | HTML_PARSE_RECOVER.value)
        let html = NSString(data: data, encoding: NSUTF8StringEncoding)
        let parse = HTMLParser(html: html!, encoding: NSUTF8StringEncoding,option: option, error: &err)
        var bodyNode = parse.body;
        if let path = bodyNode?.xpath("//a[@target='_blank']/img[@alt]") {
            for node in path {
                makeUnsplashImage(node)
            }
        }
    }
    
    private func makeUnsplashImage(node: HTMLNode) {
        let unsplashImage = UnsplashImage()
        unsplashImage.author = node.getAttributeNamed("alt")
        unsplashImage.url = node.getAttributeNamed("src")
        unsplashImage.height = node.getAttributeNamed("data-height").toInt()
        unsplashImage.width = node.getAttributeNamed("data-width").toInt()
        if unsplashImage.height > unsplashImage.width {
            unsplashImage.type = ImageType.Vertical
        } else {
            unsplashImage.type = ImageType.Horizontal
        }
    }
}
