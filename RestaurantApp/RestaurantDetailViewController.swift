//
//  RestaurantDetailViewController.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/11.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var restaurantImage: UIImageView!
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbType: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImage.image = UIImage(named: restaurant.image)
        lbName.text = restaurant.name
        lbType.text = restaurant.type
        lbLocation.text = restaurant.location
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
