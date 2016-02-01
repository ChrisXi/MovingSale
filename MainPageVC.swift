//
//  MainPageVC.swift
//  MovingSale
//
//  Created by Xi Yang on 1/26/16.
//  Copyright © 2016 Xi Yang. All rights reserved.
//

import UIKit

class MainPageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let itemArray:[Int] = [5,2,8,10]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! PostViewCell
        
//        print("a\(itemArray[indexPath.row])")
        cell.itemCount = itemArray[indexPath.row]
//        cell.itemCount = 4
        cell.initContent()
        cell.collectionView.reloadData()
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let itemCount = itemArray[indexPath.row]
        let sidePadding: CGFloat = 20.0
        let margin:CGFloat = 5.0
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let width: CGFloat = screenSize.width-sidePadding*2
        let itemWidth: CGFloat = (width - margin*2)/3
        
        var n:CGFloat = CGFloat(itemCount/3)
        if itemCount%3 != 0 {
            n += 1
        }
        let height = n*itemWidth+(n-1)*margin+2
        
        
        var whiteRoundedCornerView:UIView!
        whiteRoundedCornerView=UIView(frame: CGRectMake(0,0,self.view.bounds.width,height+20))
        whiteRoundedCornerView.backgroundColor=UIColor(red: 236/255.0, green: 236/255.0, blue: 236/255.0, alpha: 1.0)
        whiteRoundedCornerView.layer.masksToBounds=false
        
//        whiteRoundedCornerView.layer.shadowOpacity = 1.55;
//        whiteRoundedCornerView.layer.shadowOffset = CGSizeMake(1, 0);
//        whiteRoundedCornerView.layer.shadowColor=UIColor(red: 53/255.0, green: 143/255.0, blue: 185/255.0, alpha: 1.0).CGColor
//        
//        whiteRoundedCornerView.layer.cornerRadius=3.0
//        whiteRoundedCornerView.layer.shadowOffset=CGSizeMake(-1, -1)
//        whiteRoundedCornerView.layer.shadowOpacity=0.5
        cell.contentView.addSubview(whiteRoundedCornerView)
        cell.contentView.sendSubviewToBack(whiteRoundedCornerView)

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let itemCount = itemArray[indexPath.row]
        let sidePadding: CGFloat = 20.0
        let margin:CGFloat = 5.0
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let width: CGFloat = screenSize.width-sidePadding*2
        let itemWidth: CGFloat = (width - margin*2)/3
        
        var n:CGFloat = CGFloat(itemCount/3)
        if itemCount%3 != 0 {
            n += 1
        }
        let height = n*itemWidth+(n-1)*margin+2
        
        
        return height+100
    }
    
    
    

}
