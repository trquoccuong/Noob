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

protocol CrawlMachineDelegate {
    func endGetPageData(data: UnsplashImage)
}

import Foundation
class CrawlMachine {
 private  var sessionConnection: NSURLSession
    var ImageArray: [UnsplashImage]!
    var delegate : CrawlMachineDelegate!
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
        unsplashImage.url = parseURL(node.getAttributeNamed("src"))
        unsplashImage.maxHeight = node.getAttributeNamed("data-height").toInt()
        unsplashImage.maxWidth = node.getAttributeNamed("data-width").toInt()
        if unsplashImage.maxHeight > unsplashImage.maxWidth {
            unsplashImage.type = ImageType.Vertical
        } else {
            unsplashImage.type = ImageType.Horizontal
        }
//        ImageArray.append(unsplashImage)
        dispatch_async(dispatch_get_main_queue(), {
            self.delegate.endGetPageData(unsplashImage)
        })
    }
    
    
    private func parseURL(link: String) -> String{
        let ranger = link.rangeOfString("?")?.startIndex
        let fullLink = link.substringToIndex(ranger!)
        return fullLink
  }
    
    
}
