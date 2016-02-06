//
//  CollectionVC.swift
//  MovingSale
//
//  Created by Xi Yang on 2/4/16.
//  Copyright © 2016 Xi Yang. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemNum:Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        
        let x:Int = (indexPath.row%9)/3
        let y:Int = (indexPath.row%9)%3
        let batchNum:Int = indexPath.row/9

        let superFrame = collectionView.frame;
        let innerMargin:CGFloat = 5.0
        let sideMargin:CGFloat = 10.0
        let topMargin:CGFloat = 10.0
        let itemLen:CGFloat = (superFrame.width - 2*sideMargin - 2*innerMargin)/3
        
        let itemX = CGFloat(batchNum)*superFrame.width+sideMargin+(itemLen+innerMargin)*CGFloat(x)
        let itemY = topMargin+(itemLen+innerMargin)*CGFloat(y)
        
        cell.frame = CGRectMake(itemX, itemY, itemLen, itemLen)

        if batchNum*9+x+y*3 < itemNum {
            let itemNo:Int = batchNum*9+x+y*3
            cell.itemImage.image = UIImage(named: "chair"+String(itemNo))
        } else {
            cell.itemImage.image = getImageWithColor(UIColor(red: 226/255.0, green: 226/255.0, blue: 226/255.0, alpha: 1.0), size: CGSize(width: itemLen, height: itemLen))
        }
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (1+itemNum/9)*9
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNo:Int = Int((collectionView.contentOffset.x + collectionView.frame.width/2)/collectionView.frame.width)
        collectionView.setContentOffset(CGPoint(x: CGFloat(pageNo)*collectionView.frame.width, y: 0), animated: true)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let pageNo:Int = Int((collectionView.contentOffset.x + collectionView.frame.width/2)/collectionView.frame.width)
        collectionView.setContentOffset(CGPoint(x: CGFloat(pageNo)*collectionView.frame.width, y: 0), animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let itemLen:CGFloat = collectionView.frame.width/3
        return CGSize(width: itemLen, height: itemLen);
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let x:Int = (indexPath.row%9)/3
        let y:Int = (indexPath.row%9)%3
        let batchNum:Int = indexPath.row/9
        
        print(batchNum*9+x+y*3)
    }
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
}
