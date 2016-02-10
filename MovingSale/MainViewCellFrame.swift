//
//  MainViewCell.swift
//  MovingSale
//
//  Created by Xi Yang on 2/10/16.
//  Copyright © 2016 Xi Yang. All rights reserved.
//

import Foundation
import UIKit

class MainViewCellFrame {

    let innerMarginItemCell:CGFloat = 5.0
    let sideMarginItemCell:CGFloat = 10.0
    let topMarginItemCell:CGFloat = 10.0
    let bottomMarginItemCell:CGFloat = 10.0

    func getItemsViewHeight(superFrameWidth: CGFloat, itemNum: Int) -> CGFloat {
        
        if itemNum > 6 {
            return superFrameWidth - 2*sideMarginItemCell
        } else if itemNum == 0 {
            return 0.0
        } else {
            let row:Int = (itemNum-1)/3+1
            let itemLen:CGFloat = getItemCellLen(superFrameWidth)
            let height:CGFloat = topMarginItemCell+CGFloat(row)*itemLen+(CGFloat(row)-1)*innerMarginItemCell+bottomMarginItemCell

            return height
        }
    }
    
    func getItemCellPos(superFrameWidth: CGFloat, itemNum: Int, indexPathRow: Int) -> (CGFloat, CGFloat, CGFloat) {
        
        let batchNum:Int = indexPathRow/9
        
        var x:Int = (indexPathRow%9)/3
        var y:Int = (indexPathRow%9)%3
        
        if itemNum < 10 {
            x = (indexPathRow%9)%3
            y = (indexPathRow%9)/3
        }
        
        let itemLen:CGFloat = getItemCellLen(superFrameWidth)
        
        let itemX = CGFloat(batchNum)*superFrameWidth+sideMarginItemCell+(itemLen+innerMarginItemCell)*CGFloat(x)
        let itemY = topMarginItemCell+(itemLen+innerMarginItemCell)*CGFloat(y)
        
        return (itemX, itemY, itemLen)
    }
    
    func getItemCellLen(superFrameWidth: CGFloat) -> CGFloat {
        let itemLen:CGFloat = (superFrameWidth - 2*sideMarginItemCell - 2*innerMarginItemCell)/3
        
        return itemLen
    }
    
    func heightForLabelInfo(text:String, font:UIFont, superFrameWidth:CGFloat, defaultHeight: CGFloat) -> CGFloat{
        
        let width:CGFloat = superFrameWidth - 2*sideMarginItemCell
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
//        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        
        let height:CGFloat = defaultHeight<label.frame.height ? defaultHeight:label.frame.height
        
        return height
    }
    
    
    
}