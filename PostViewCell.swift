//
//  PostViewCell.swift
//  MovingSale
//
//  Created by Xi Yang on 1/25/16.
//  Copyright © 2016 Xi Yang. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var itemCount:Int?
    var expandItemImg: Bool = false
    
    func initContent() {
        /*avatar button*/

        let avatarBtn = UIButton(type: UIButtonType.System) as UIButton
        avatarBtn.frame = CGRectMake(20, 0, 40, 40)
        avatarBtn.setImage(UIImage(named: "avatar"), forState: .Normal)
      
//        viewItemBtn.addTarget(self, action: "viewButtonAction:", forControlEvents: .TouchUpInside)
        self.contentView.addSubview(avatarBtn)
        
        /*user_name label*/
        
        let usrNamelabel = UILabel(frame: CGRectMake(65, 0, 200, 20))
        usrNamelabel.textAlignment = NSTextAlignment.Left
        usrNamelabel.font = UIFont.systemFontOfSize(18.0);
        usrNamelabel.text = "Moving sale"
        self.contentView.addSubview(usrNamelabel)
        
        /*post data&time label*/
        
        let postlabel = UILabel(frame: CGRectMake(65, 25, 200, 15))
        postlabel.textAlignment = NSTextAlignment.Left
        postlabel.font = UIFont.systemFontOfSize(12.0);
        postlabel.text = "posted: 12/17/1990 16:21"
        self.contentView.addSubview(postlabel)
        
        /*post information multiple line label*/
        
        let infoLabel:UILabel = UILabel(frame: CGRectMake(20 ,43, 300, 20));
        infoLabel.textAlignment = NSTextAlignment.Left;
        infoLabel.numberOfLines = 0;
        infoLabel.font = UIFont.systemFontOfSize(14.0);
//        infoLabel.text = "First label";
        infoLabel.text = "First label\nsecond line\njdjdjd\nksksk";
        infoLabel.sizeToFit()
        print(infoLabel.frame.height)
        infoLabel.frame = CGRectMake(20 ,43, 300, 20)
        self.contentView.addSubview(infoLabel);
        
        /*collection view*/
        let topPadding:CGFloat = 50
        let sidePadding: CGFloat = 20.0
        let innerMargin:CGFloat = 5.0
        let sideMargin: CGFloat = 5.0
        let topMargin:CGFloat = 5.0
        let bottomMargin:CGFloat = 5.0
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let width: CGFloat = screenSize.width-sidePadding*2
        let itemWidth: CGFloat = (width - innerMargin*2-sideMargin*2)/3 /*margin*4*/
        
        var n:CGFloat = CGFloat(itemCount!/3)
        if itemCount!%3 != 0 {
            n += 1
        }
        let height = n*itemWidth+(n-1)*innerMargin+10

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: topMargin, left: bottomMargin, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        layout.minimumInteritemSpacing = innerMargin
        layout.minimumLineSpacing = innerMargin
        
        let frame:CGRect = CGRect(x: sidePadding, y: topPadding, width: width, height: height)
        collectionView.collectionViewLayout = layout
        collectionView.frame = frame
        
        collectionView.scrollEnabled = false
        
        /*expand/collapse button*/
        let viewItemBtn = UIButton(type: UIButtonType.System) as UIButton
        viewItemBtn.frame = CGRectMake(sidePadding, topPadding+height+1, width, 15)
        viewItemBtn.backgroundColor = UIColor(red: 226/255.0, green: 226/255.0, blue: 226/255.0, alpha: 1.0)
        viewItemBtn.setTitleColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0), forState: UIControlState.Normal)
        viewItemBtn.addTarget(self, action: "viewButtonAction:", forControlEvents: .TouchUpInside)
        viewItemBtn.setTitle("Expand", forState: .Normal)
        viewItemBtn.titleLabel!.font = UIFont(name: "Times New Roman", size: 12)
        self.contentView.addSubview(viewItemBtn)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return itemCount!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("commodityCell", forIndexPath: indexPath) as! CommodityViewCell
        
        cell.image.image = UIImage(named: "chair"+String(indexPath.row+1))

        return cell
    }
    
    /*
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize
    {
        
        return CGSize(width: 5, height: 5)
        //return CGSize(width: 100, height: self.categoriesView.frame.height)
    }*/
    
    func viewButtonAction(sender: UIButton!) {
        expandItemImg = !expandItemImg
        if (expandItemImg == true) {
            sender.setTitle("Collpase", forState: .Normal)
        } else {
            sender.setTitle("Expand", forState: .Normal)
        }
    }
    

    
}
