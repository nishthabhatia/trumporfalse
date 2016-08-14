//
//  StartViewController.swift
//  trumporfalse
//
//  Created by Justin Athill on 8/14/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var fingerPoint: UIImageView!
    
    var myTimer: NSTimer? = nil
    var origCenter : CGPoint? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        // Do any additional setup after loading the view.
        origCenter = fingerPoint.center
        
    }
    
    override func viewDidAppear(animated: Bool) {
        myTimer = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector:"animateFinger", userInfo: nil, repeats: true)
        
    }
    
    func animateFinger() {
        fingerPoint.hidden = false
        fingerPoint.alpha = 1;
        print(fingerPoint.center.y)
        UIView.animateWithDuration(1.5, animations: {
            var newCenter = self.fingerPoint.center
            newCenter.y -= 130
            self.fingerPoint.center = newCenter
        }) {
            (true) in
            UIView.animateWithDuration(0.5, animations: {
                self.fingerPoint.alpha = 0
            }) {
                (true) in
                self.fingerPoint.center.y += 130
                self.fingerPoint.hidden = true
            }
            
            print(self.fingerPoint.center.y)
        }

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