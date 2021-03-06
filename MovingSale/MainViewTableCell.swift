//
//  MainViewTableCell.swift
//  MovingSale
//
//  Created by Xi Yang on 2/3/16.
//  Copyright © 2016 Xi Yang. All rights reserved.
//

import UIKit

class MainViewTableCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    let UIFrame = MainViewCellFrame()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelPostTime: UILabel!
    @IBOutlet weak var labelPostInfo: UILabel!
    
    var itemNum:Int = 9
    
    
    func initContent() {
//      HelveticaNeue-UltraLight, Chalkduster, Georgia, Georgia-Italic, AmericanTypewriter-Bold
//        print("asdf\(self.itemNum)")
        
        
        labelUserName.font = UIFont(name: "Georgia-Italic", size: 30)
        labelPostTime.font = UIFont(name: "Georgia-Italic", size: 10)
        labelPostInfo.font = UIFont(name: "Georgia-Italic", size: 12)
        
        var strPostInfo: String = "Johnson had season highs with 27 points and 11 assists in Brooklyn's 128-119 victory on Friday night. The Nets set season bests for points and 3-pointers while snapping a five-game losing streak. Dwyane Wade scored 22 points and Chris Bosh added 20 points for the Heat, who have won six of seven. Goran Dragic had 12 points, nine assists and eight rebounds.Johnson had season highs with 27 points and 11 assists in Brooklyn's 128-119 victory on Friday night. The Nets set season bests for points and 3-pointers while snapping a five-game losing streak. Dwyane Wade scored 22 points and Chris Bosh added 20 points for the Heat, who have won six of seven. Goran Dragic had 12 points, nine assists and eight rebounds."
        if self.itemNum > 8 {
            strPostInfo = "The Nets set season bests for points and 3-pointers while snapping a five-game losing streak."
        }
        
        var labelPostInfoHeight:CGFloat = 100.0
        
        labelPostInfoHeight = UIFrame.heightForLabelInfo(strPostInfo, font: labelPostInfo.font, superFrameWidth: UIScreen.mainScreen().bounds.width, defaultHeight: labelPostInfoHeight)
        
        labelPostInfo.textAlignment = NSTextAlignment.Left
        labelPostInfo.numberOfLines = 10
        
        labelPostInfo.text = strPostInfo
        
        let labelPostInfoHeightCostraint: NSLayoutConstraint = NSLayoutConstraint(item: labelPostInfo, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute , multiplier: 1, constant: labelPostInfoHeight)
//        labelPostInfo.addConstraint(labelPostInfoHeightCostraint)
//        NSLayoutConstraint.activateConstraints([labelPostInfoHeightCostraint])
//        print(labelPostInfo.constraints)
//        labelPostInfo.removeConstraint(labelPostInfoHeightCostraint)
        
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        collectionView.showsHorizontalScrollIndicator = false
        
        let itemsViewHeight:CGFloat = UIFrame.getItemsViewHeight(UIScreen.mainScreen().bounds.width, itemNum: itemNum)

        let itemsViewHeightCostraint: NSLayoutConstraint = NSLayoutConstraint(item: collectionView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute , multiplier: 1, constant: itemsViewHeight)
        
//        collectionView.addConstraint(itemsViewHeightCostraint)
//        collectionView.updateConstraints()
        /**/
//        NSLayoutConstraint.activateConstraints([itemsViewHeightCostraint])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //initContent()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as! ItemViewCollectionCell
        
        var x:Int = (indexPath.row%9)/3
        var y:Int = (indexPath.row%9)%3
        
        if itemNum < 10 {
            x = (indexPath.row%9)%3
            y = (indexPath.row%9)/3
        }
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

            cell.itemImage.image = getImageWithColor(UIColor(red: 0/255.0, green: 0/255.0, blue: 255/255.0, alpha: 1.0), size: CGSize(width: itemLen, height: itemLen))
        }

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if itemNum < 10 {
            return itemNum
        } else {
            return (1+itemNum/9)*9
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let superFrame = collectionView.frame;
        let innerMargin:CGFloat = 5.0
        let sideMargin:CGFloat = 10.0
        let itemLen:CGFloat = (superFrame.width - 2*sideMargin - 2*innerMargin)/3
        
        return CGSize(width: itemLen, height: itemLen)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let x:Int = (indexPath.row%9)/3
        let y:Int = (indexPath.row%9)%3
        let batchNum:Int = indexPath.row/9
        
        print(batchNum*9+x+y*3)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNo:Int = Int((collectionView.contentOffset.x + collectionView.frame.width/2)/collectionView.frame.width)
        collectionView.setContentOffset(CGPoint(x: CGFloat(pageNo)*collectionView.frame.width, y: 0), animated: true)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let pageNo:Int = Int((collectionView.contentOffset.x + collectionView.frame.width/2)/collectionView.frame.width)
        collectionView.setContentOffset(CGPoint(x: CGFloat(pageNo)*collectionView.frame.width, y: 0), animated: true)
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
    
    func getItemNum(itemNum:Int) {
        self.itemNum = itemNum
//        print(self.itemNum)
    }
}
