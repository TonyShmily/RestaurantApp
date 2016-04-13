//
//  DetailTableViewController.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/11.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var restaurant: Restaurant!
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var ratingBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        //restaurantImage.frame = CGRectMake(0, 0, 400, 200)
        restaurantImage.image = UIImage(named: restaurant.image)
        title = restaurant.name
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if restaurant.rating != "" {
            self.ratingBtn.setImage(UIImage(named:  restaurant.rating), forState: .Normal)
        }
        
        
        tableView.estimatedRowHeight = 36
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLable.text = "餐馆名"
            cell.valueLable.text = restaurant.name
        case 1:
            cell.fieldLable.text = "类型"
            cell.valueLable.text = restaurant.type
        case 2:
            cell.fieldLable.text = "地点"
            cell.valueLable.text = restaurant.location
        case 3:
            cell.fieldLable.text = "是否来过"
            cell.valueLable.text = restaurant.isVisited ? "来过" : "没有来过"
        default:
            cell.fieldLable.text = ""
            cell.valueLable.text = ""
        }
        cell.backgroundColor = UIColor.clearColor()

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap"{
            let destVC = segue.destinationViewController as! MapViewController
            destVC.restaurant = self.restaurant
        }
    }
 

    @IBAction func colse(segue: UIStoryboardSegue) {
        if let reviewVC = segue.sourceViewController as? ReviewViewController {
            if let rating = reviewVC.rating {
                self.restaurant.rating = rating
                self.ratingBtn.setImage((UIImage(named: rating)), forState: .Normal)
            }
        }
        
    }
    
}
