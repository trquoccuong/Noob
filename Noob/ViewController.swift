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
    
//    var galleryItems: [GalleryItem] = []
    
    // MARK: -
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initGalleryItems()
        
//        let nib = UINib(nibName: "CollectionReusableView", bundle: nil)
//        collectionView.registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")
//        
//        collectionView.reloadData()
    }
    
//    private func initGalleryItems() {
//        
//        var items = [GalleryItem]()
//        let inputFile = NSBundle.mainBundle().pathForResource("items", ofType: "plist")
//        
//        let inputDataArray = NSArray(contentsOfFile: inputFile!)
//        
//        for inputItem in inputDataArray as [Dictionary<String, String>] {
//            let galleryItem = GalleryItem(dataDictionary: inputItem)
//            items.append(galleryItem)
//        }
//        
//        galleryItems = items
//    }
    
    // MARK: -
    // MARK: - UICollectionViewDataSource
    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return galleryItems.count
//    }
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as CustomCell
//        
//        cell.setGalleryItem(galleryItems[indexPath.row])
//        return cell
//        
//    }
//    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//        
//        let commentView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "CollectionReusableView", forIndexPath: indexPath) as CollectionReusableView
//        
//        commentView.label.text = "Supplementary view of kind \(kind)"
//        
//        return commentView
//    }
//    
//    // MARK: -
//    // MARK: - UICollectionViewDelegate
//    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        
//        let alert = UIAlertController(title: "didSelectItemAtIndexPath:", message: "Indexpath = \(indexPath)", preferredStyle: .Alert)
//        
//        let alertAction = UIAlertAction(title: "Dismiss", style: .Destructive, handler: nil)
//        alert.addAction(alertAction)
//        
//        self.presentViewController(alert, animated: true, completion: nil)
//    }
//    
//    // MARK: -
//    // MARK: - UICollectionViewFlowLayout
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let picDimension = self.view.frame.size.width / 4.0
//        return CGSizeMake(picDimension, picDimension)
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        let leftRightInset = self.view.frame.size.width / 14.0
//        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
//    }
}

