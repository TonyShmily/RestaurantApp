//
//  RestaurantsTableViewController.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/9.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {

    var resNameList = ["咖啡胡同", "霍米", "茶.家", "洛伊斯咖啡", "贝蒂生蚝", "福奇餐馆", "阿波画室", "伯克街面包坊", "黑氏巧克力", "惠灵顿雪梨", "北州", "布鲁克林塔菲", "格雷厄姆大街肉", "华夫饼 & 沃夫", "五叶", "眼光咖啡", "忏悔", "巴拉菲娜", "多尼西亚", "皇家橡树", "泰咖啡"]
    
    var resImgList =
        ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]

    var resLocation = ["香港", "香港", "香港", "香港", "香港", "香港", "香港", "悉尼", "悉尼", "悉尼", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "伦敦", "伦敦", "伦敦", "伦敦"]
    
    var resType = ["咖啡 & 茶店","咖啡", "茶屋", "奥地利式 & 休闲饮料","法式", "面包房", "面包房", "巧克力", "咖啡", "美式 & 海鲜", "美式", "美式","早餐 & 早午餐", "法式 & 茶", "咖啡 & 茶", "拉丁美式", "西班牙式", "西班牙式", "西班牙式", "英式", "泰式"]
    
    var resHasBM = [Bool](count:21,repeatedValue: false)
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resNameList.count
    }
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let listMenu = UIAlertController(title: nil, message: "选择", preferredStyle: .ActionSheet)
        let cancalAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        let dail = {
            (action: UIAlertAction) -> Void in
            let alert = UIAlertController(title: "提示", message: "您无权拨打此号码！", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        let dailAction = UIAlertAction(title: "拨打 66\(indexPath.row + 1)", style: .Default, handler: dail)
        
        let bookmarkAction = UIAlertAction(title: "收藏", style: .Default) { (_) in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.viewWithTag(1)?.hidden = false
            //cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            self.resHasBM[indexPath.row] = true
        }
        
        let unbookmarkAction = UIAlertAction(title: "取消收藏", style: .Default) { (_) in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.viewWithTag(1)?.hidden = true
            //cell?.accessoryType = UITableViewCellAccessoryType.None
            self.resHasBM[indexPath.row] = false
        }

        
        listMenu.addAction(cancalAction)
        listMenu.addAction(dailAction)
        resHasBM[indexPath.row] ? listMenu.addAction(unbookmarkAction) : listMenu.addAction(bookmarkAction)
        
        self.presentViewController(listMenu, animated: true, completion: nil)
    }
     */
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell

        cell.restaurantName?.text = resNameList[indexPath.row]
        cell.restaurantLocation.text = resLocation[indexPath.row]
        cell.restaurantType.text = resType[indexPath.row]
        cell.restaurantImage.layer.cornerRadius = 30
            //cell.restaurantImage.frame.size.width / 2
        cell.restaurantImage.clipsToBounds = true
        
        //cell.accessoryType = resHasBM[indexPath.row] ? .Checkmark : .None
        
        cell.restaurantImage?.image = UIImage(named: resImgList[indexPath.row])
        cell.heartImage.image = UIImage(named: "heart")
        cell.heartImage.hidden = !resHasBM[indexPath.row];
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
            resNameList.removeAtIndex(indexPath.row)
            resLocation.removeAtIndex(indexPath.row)
            resType.removeAtIndex(indexPath.row)
            resImgList.removeAtIndex(indexPath.row)
            resHasBM.removeAtIndex(indexPath.row)
            
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
            self.resNameList.removeAtIndex(indexPath.row)
            self.resLocation.removeAtIndex(indexPath.row)
            self.resType.removeAtIndex(indexPath.row)
            self.resImgList.removeAtIndex(indexPath.row)
            self.resHasBM.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
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
        if segue.identifier == "showRestaurantDetail"{
        let destVC = segue.destinationViewController as! RestaurantDetailViewController
        destVC.resImageName = resImgList[tableView.indexPathForSelectedRow!.row]
            destVC.resName = resNameList[tableView.indexPathForSelectedRow!.row]
            destVC.resType = resType[tableView.indexPathForSelectedRow!.row]
            destVC.resAdd = resLocation[tableView.indexPathForSelectedRow!.row]
        }
        
    }
    

}
