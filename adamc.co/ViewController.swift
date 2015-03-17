//
//  ViewController.swift
//  adamc.co
//
//  Created by Adam cherochak on 3/17/15.
//  Copyright (c) 2015 Adam Cherochak. All rights reserved.
// Source: http://blog.revivalx.com/2014/12/11/swift-tutorial-a-simple-ios-app/
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {
    // Facebook
    @IBOutlet var fbLoginView : FBLoginView!
    
// outlets for user login to server - REST/JSON
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBAction func btnLogin(sender: AnyObject) {
        // let user know something is happening
        lblTitle.text = "One moment..."
        // REST API request with JSON data response
        var url : String = "http://demo.revivalx.com/todolist-api/login.php"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            if (jsonResult != nil) {
                // Let user know there is an error
                self.lblTitle.text = "Something went wrong!"
                println(jsonResult)
            } else {
                // couldn't load JSON, look at error
                // Let user know there is an error
                self.lblTitle.text = "Something went wrong!"
            }
            // let user know login successself.ful
            self.lblTitle.text = "Success!"
        })
//-END REST/JSON
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

