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
        
        var infoLabelExtendedH:Bool = false
        
        /*----------------------setting ui parameters-----------------*/
        /*multi control with same parameters*/
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let sidePadding: CGFloat = 20.0 /*side padding: avatar button start x,
                                                        info label start x,
                                                        collection item view start x,
                                                        expand_collapse button start x*/
        /*avatar button parameters*/
        let avatarBtnY: CGFloat = 0.0   /*start y*/
        let avatarBtnW: CGFloat = 40.0  /*width*/
        
        /*user name label parameters*/
        let userNameLabelY: CGFloat = 0.0    /*start y*/
        let userNameLabelX: CGFloat = sidePadding+avatarBtnW+5.0 /*start x, gap: 5*/
        let userNameLabelH: CGFloat = 20.0   /*height*/
        let userNameLabelW: CGFloat = screenSize.width-sidePadding-userNameLabelX /*width*/
        
        /*post date&time label parameters*/
        let postLabelY: CGFloat = userNameLabelY+userNameLabelH+5.0 /*start y, gap: 5*/
        let postLabelX: CGFloat = userNameLabelX    /*start x*/
        let postLabelH: CGFloat = 15.0             /*height*/
        let postLabelW: CGFloat = userNameLabelW   /*width*/
        
        /*post information label (multiple line) parameters*/
        let infoLabelY: CGFloat = avatarBtnW+3.0 /*start y, gap: 3*/
        let infoLabelX: CGFloat = sidePadding    /*start x*/
        var infoLabelH: CGFloat = 60.0           /*height (default)*/
        let infoLabelW: CGFloat = screenSize.width-2*sidePadding /*width*/
        
        /*collection item view parameters*/
        var itemViewItemCount:CGFloat = CGFloat(itemCount!/3)
        if itemCount!%3 != 0 {
            itemViewItemCount += 1
        }
        let itemViewInnerM: CGFloat = 5.0   /*inner margin*/
        let itemViewSideM: CGFloat = 5.0    /*side margin*/
        let itemViewTopM: CGFloat = 5.0     /*top margin*/
        let itemViewBottomM: CGFloat = 5.0  /*bottom margin*/
        var itemViewY: CGFloat = infoLabelY+infoLabelH+5.0 /*start y, gap: 5*/
        let itemViewX: CGFloat = sidePadding               /*start x*/
        let itemViewW: CGFloat = screenSize.width-sidePadding*2  /*width*/
        let itemViewSingleW: CGFloat = (itemViewW-itemViewInnerM*2-itemViewSideM*2)/3 /*each item width*/
        let itemViewH: CGFloat = itemViewItemCount*itemViewSingleW+(itemViewItemCount-1)*itemViewInnerM
        
        /*expand_collapse button parameters*/
        let expandCollBtnY: CGFloat = itemViewY+itemViewH+2.0 /*start y, gap: 2*/
        let expandCollBtnX: CGFloat = sidePadding    /*start x*/
        let expandCollBtnW: CGFloat = itemViewW      /*width*/
        let expandCollBtnH: CGFloat = 15.0           /*height*/
        
        
        /*----------------------setting ui control--------------------*/
        /*avatar button*/
        let avatarBtn = UIButton(type: UIButtonType.System) as UIButton
        avatarBtn.frame = CGRectMake(sidePadding, avatarBtnY, avatarBtnW, avatarBtnW)
        avatarBtn.setImage(UIImage(named: "avatar"), forState: .Normal)
        self.contentView.addSubview(avatarBtn)
        
        /*user name label*/
        let userNameLabel = UILabel(frame: CGRectMake(userNameLabelX, userNameLabelY, userNameLabelW, userNameLabelH))
        userNameLabel.textAlignment = NSTextAlignment.Left
        userNameLabel.font = UIFont.systemFontOfSize(18.0);
        userNameLabel.text = "Moving sale"
        self.contentView.addSubview(userNameLabel)
        
        /*post date&time label*/
        let postLabel = UILabel(frame: CGRectMake(postLabelX, postLabelY, postLabelW, postLabelH))
        postLabel.textAlignment = NSTextAlignment.Left
        postLabel.font = UIFont.systemFontOfSize(12.0);
        postLabel.text = "posted: 12/17/1990 16:21"
        self.contentView.addSubview(postLabel)
        
        /*post information label*/
        let infoLabel:UILabel = UILabel(frame: CGRectMake(infoLabelX, infoLabelY, infoLabelW, infoLabelH));
        infoLabel.textAlignment = NSTextAlignment.Left;
        infoLabel.numberOfLines = 0;
        infoLabel.font = UIFont.systemFontOfSize(14.0);
        infoLabel.text = "First label\nsecond line\njdjdjd\nksksk";
        infoLabel.sizeToFit()
        if infoLabelH < infoLabel.frame.height {
            infoLabelExtendedH = true
        } else {
            infoLabelH = infoLabel.frame.height
        }
        infoLabel.frame = CGRectMake(infoLabelX, infoLabelY, infoLabelW, infoLabelH)
        self.contentView.addSubview(infoLabel);
        
        /*collection item view*/
        itemViewY = infoLabelY+infoLabelH+5.0 /*height (default)*/

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: itemViewTopM, left: itemViewSideM, bottom: itemViewBottomM, right: itemViewSideM)
        layout.itemSize = CGSize(width: itemViewSingleW, height: itemViewSingleW)
        layout.minimumInteritemSpacing = itemViewInnerM
        layout.minimumLineSpacing = itemViewInnerM
        
        let frame:CGRect = CGRect(x: itemViewX, y: itemViewY, width: itemViewW, height: itemViewH)
        
        collectionView.collectionViewLayout = layout
        collectionView.frame = frame
        collectionView.scrollEnabled = false
        
        /*expand_collapse button*/
        let viewItemBtn = UIButton(type: UIButtonType.System) as UIButton
        viewItemBtn.frame = CGRectMake(expandCollBtnX, expandCollBtnY, expandCollBtnW, expandCollBtnH)
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
