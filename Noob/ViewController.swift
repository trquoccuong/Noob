//
//  ViewController.swift
//  Noob
//
//  Created by ios27 on 3/20/15.
//  Copyright (c) 2015 ios27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var crawlMachine = CrawlMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        crawlMachine.startCrawl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

