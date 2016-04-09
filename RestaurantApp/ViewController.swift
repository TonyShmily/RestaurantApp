//
//  ViewController.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/9.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    var resData = ["啃的鸡","餐馆1","餐馆2","餐馆3","餐馆4","餐馆5",
                   "Starbucks","Restaurant1","Restaurant2","Restaurant3",
                   "Restaurant4","Restaurant5"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = resData[indexPath.row]
        cell.imageView!.image = UIImage(named: "respic")
        return cell
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

