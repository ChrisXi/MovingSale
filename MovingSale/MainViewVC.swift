//
//  MainViewVC.swift
//  MovingSale
//
//  Created by Xi Yang on 2/3/16.
//  Copyright © 2016 Xi Yang. All rights reserved.
//

import UIKit

class MainViewVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 600.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewDidLayoutSubviews() {
        print(tableView.frame.size.width)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as! MainViewTableCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
////        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as! MainViewTableCell
//        
//
////        cell.getHeight()
//        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell") as! MainViewTableCell
//        cell.collectionView.reloadData()
////        cell.getHeight()
//        
//        return 600
//    }
    
}
