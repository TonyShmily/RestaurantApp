//
//  RestaurantsTableViewController.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/9.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import UIKit
import CoreData

class RestaurantsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    var restaurants:[Restaurant] = []
    
    var frc: NSFetchedResultsController!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let request = NSFetchRequest(entityName: "Restaurant")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        
        frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: buffer!, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        do {
            try frc.performFetch()
            restaurants = frc.fetchedObjects as! [Restaurant]
        }catch{
            print(error)
        }
    }

    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            if let _newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Automatic)
            }
        case .Delete:
            if let _indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        case .Update:
            if let _indexPath = indexPath {
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        default:
            tableView.reloadData()
        }
        
        restaurants = controller.fetchedObjects as! [Restaurant]
    }
    
    
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 1
    //    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell

        cell.restaurantName?.text = restaurants[indexPath.row].name
        cell.restaurantLocation.text = restaurants[indexPath.row].location
        cell.restaurantType.text = restaurants[indexPath.row].type
        cell.restaurantImage.layer.cornerRadius = //30
            cell.restaurantImage.frame.size.width / 2
        cell.restaurantImage.clipsToBounds = true
        
        //cell.accessoryType = resHasBM[indexPath.row] ? .Checkmark : .None
        
        cell.restaurantImage?.image = UIImage(data: restaurants[indexPath.row].image!)
        //cell.heartImage.image = UIImage(named: "heart")
        //cell.heartImage.hidden = !RestaurantList[indexPath.row].isVisited;
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            restaurants.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
        //tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .Default, title: "分享") { (action, indexPath) in
            let alert = UIAlertController(title: "分享到", message: "请选择分享社交类型", preferredStyle: .ActionSheet)
            
            let wechatAction = UIAlertAction(title: "微信", style: .Default, handler: nil)
            let weiboAction = UIAlertAction(title: "新浪微博", style: .Default, handler: nil)
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            
            let cancalAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            
            alert.addAction(wechatAction)
            alert.addAction(weiboAction)
            alert.addAction(twitterAction)
            alert.addAction(cancalAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor.lightGrayColor()
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "删除") { (action, indexPath) in
//            self.restaurants.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            let buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
            let restaurantToDel = self.frc.objectAtIndexPath(indexPath) as! Restaurant
            
            buffer?.deleteObject(restaurantToDel)
            do {
                try buffer?.save()
            }
            catch
            {
                print(error)
            }
            
        }
        
        
        return [shareAction,deleteAction]
    }
    
    
    

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            if segue.identifier == "showDetail"{
            let destVC = segue.destinationViewController as! DetailTableViewController
            destVC.restaurant = restaurants[tableView.indexPathForSelectedRow!.row]
        }
    }
    

    @IBAction func unwindToHome(segue: UIStoryboardSegue){
        
    }
    
}
