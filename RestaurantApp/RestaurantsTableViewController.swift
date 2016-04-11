//
//  RestaurantsTableViewController.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/9.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {
    /*
    var resNameList = ["咖啡胡同", "霍米", "茶.家", "洛伊斯咖啡", "贝蒂生蚝", "福奇餐馆", "阿波画室", "伯克街面包坊", "黑氏巧克力", "惠灵顿雪梨", "北州", "布鲁克林塔菲", "格雷厄姆大街肉", "华夫饼 & 沃夫", "五叶", "眼光咖啡", "忏悔", "巴拉菲娜", "多尼西亚", "皇家橡树", "泰咖啡"]
    
    var resImgList =
        ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]

    var resLocation = ["香港", "香港", "香港", "香港", "香港", "香港", "香港", "悉尼", "悉尼", "悉尼", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "伦敦", "伦敦", "伦敦", "伦敦"]
    
    var resType = ["咖啡 & 茶店","咖啡", "茶屋", "奥地利式 & 休闲饮料","法式", "面包房", "面包房", "巧克力", "咖啡", "美式 & 海鲜", "美式", "美式","早餐 & 早午餐", "法式 & 茶", "咖啡 & 茶", "拉丁美式", "西班牙式", "西班牙式", "西班牙式", "英式", "泰式"]
    
    var resHasBM = [Bool](count:21,repeatedValue: false)
     */
   
    
    var RestaurantList = [
        Restaurant(name: "咖啡胡同", type: "咖啡 & 茶店", location: "香港", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "霍米", type: "咖啡", location: "香港", image: "homei.jpg", isVisited: false),
        Restaurant(name: "茶.家", type: "茶屋", location: "香港", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "洛伊斯咖啡", type: "奥地利式 & 休闲饮料", location: "香港", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "贝蒂生蚝", type: "法式", location: "香港", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "福奇餐馆", type: "面包房", location: "香港", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "阿波画室", type: "面包房", location: "香港", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "伯克街面包坊", type: "巧克力", location: "悉尼", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "黑氏巧克力", type: "咖啡", location: "悉尼", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "惠灵顿雪梨", type: "美式 & 海鲜", location: "悉尼", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "北州", type: "美式", location: "纽约", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "布鲁克林塔菲", type: "美式", location: "纽约", image: "traif.jpg", isVisited: false),
        Restaurant(name: "格雷厄姆大街肉", type: "早餐 & 早午餐", location: "纽约", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "华夫饼 & 沃夫", type: "法式 & 茶", location: "纽约", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "五叶", type: "咖啡 & 茶", location: "纽约", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "眼光咖啡", type: "拉丁美式", location: "纽约", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "忏悔", type: "西班牙式", location: "纽约", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "巴拉菲娜", type: "西班牙式", location: "伦敦", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "多尼西亚", type: "西班牙式", location: "伦敦", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "皇家橡树", type: "英式", location: "伦敦", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "泰咖啡", type: "泰式", location: "伦敦", image: "thaicafe.jpg", isVisited: false)
    ]

    
    func loadRestaurantInfo(){
        

    }
//    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
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
        return RestaurantList.count
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

        cell.restaurantName?.text = RestaurantList[indexPath.row].name
        cell.restaurantLocation.text = RestaurantList[indexPath.row].location
        cell.restaurantType.text = RestaurantList[indexPath.row].type
        cell.restaurantImage.layer.cornerRadius = 30
            //cell.restaurantImage.frame.size.width / 2
        cell.restaurantImage.clipsToBounds = true
        
        //cell.accessoryType = resHasBM[indexPath.row] ? .Checkmark : .None
        
        cell.restaurantImage?.image = UIImage(named: RestaurantList[indexPath.row].image)
        cell.heartImage.image = UIImage(named: "heart")
        cell.heartImage.hidden = !RestaurantList[indexPath.row].isVisited;
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
            RestaurantList.removeAtIndex(indexPath.row)
            
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
            self.RestaurantList.removeAtIndex(indexPath.row)
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
            if segue.identifier == "showDetail"{
            let destVC = segue.destinationViewController as! DetailTableViewController
            destVC.restaurant = RestaurantList[tableView.indexPathForSelectedRow!.row]
        }
        
    }
    

}
