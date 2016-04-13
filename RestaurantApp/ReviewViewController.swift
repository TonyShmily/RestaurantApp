//
//  ReviewViewController.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/13.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    var rating: String?
    
    @IBAction func ratingBtnTapped(sender: UIButton) {
        switch sender.tag {
        case 100:
            rating = "great"
        case 200:
            rating = "good"
        case 300:
            rating = "dislike"
        default:
            break
        }
        
        performSegueWithIdentifier("unwindToDetail", sender: sender)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageState()
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imageState(){
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        blurEffectView.frame = view.frame
        bgImageView.addSubview(blurEffectView)
    }

    override func viewDidAppear(animated: Bool){
        stackView.transform = CGAffineTransformMakeScale(0,0)
       // stackView.alpha = 0
//        UIView.animateWithDuration(0.3, animations: {
//            self.stackView.transform = CGAffineTransformIdentity
//            self.stackView.alpha = 1
//            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations:{
            self.stackView.transform = CGAffineTransformIdentity
            self.stackView.alpha = 1
            }, completion: nil)
    }
    
    
    
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .BlackOpaque    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
