//
//  AddRestaurantController.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/14.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var resImage: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfType: UITextField!
    @IBOutlet weak var tfLocation: UITextField!
    @IBOutlet weak var cbYes: UIButton!
    @IBOutlet weak var cbNo: UIButton!
    
    var restaurant = Restaurant(name: "", type: "", location: "", image: "", isVisited: false)
    
    @IBAction func visitedClick(sender: UIButton) {
        switch sender.tag {
        case 100:
            self.restaurant.isVisited = true
        case 200:
            self.restaurant.isVisited = false
        default:
            self.restaurant.isVisited = false
        }
        
        cbYes.backgroundColor = restaurant.isVisited ? UIColor.orangeColor() :UIColor.lightGrayColor()
        cbNo.backgroundColor = !restaurant.isVisited ? UIColor.orangeColor() :UIColor.lightGrayColor()
    }
    
    @IBAction func saveClick(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
     func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        resImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        resImage.contentMode = .ScaleToFill
        resImage.clipsToBounds = true
        
        let leftCons = NSLayoutConstraint(item: resImage, attribute: .Leading, relatedBy: .Equal, toItem: resImage.superview, attribute: .Leading, multiplier: 1, constant: 0)
        let rightCons = NSLayoutConstraint(item: resImage, attribute: .Trailing, relatedBy: .Equal, toItem: resImage.superview, attribute: .Trailing, multiplier: 1, constant: 0)
        let topCons = NSLayoutConstraint(item: resImage, attribute: .Top, relatedBy: .Equal, toItem: resImage.superview, attribute: .Top, multiplier: 1, constant: 0)
        let bottomCons = NSLayoutConstraint(item: resImage, attribute: .Bottom, relatedBy: .Equal, toItem: resImage.superview, attribute: .Bottom, multiplier: 1, constant: 0)
        
        leftCons.active = true
        rightCons.active = true
        topCons.active = true
        bottomCons.active = true

        
        
        dismissViewControllerAnimated(true, completion: nil)

    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
