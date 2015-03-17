//
//  DashViewController.swift
//  adamc.co
//
//  Created by Adam cherochak on 3/17/15.
//  Copyright (c) 2015 Adam Cherochak. All rights reserved.
// Source: http://blog.revivalx.com/2014/12/11/swift-tutorial-a-simple-ios-app/
//

import UIKit

class DashViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView : FBLoginView!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMoreInfo: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    
   override func viewDidLoad() {
       super.viewDidLoad()

        // Do any additional setup after loading the view.
    // Facebook
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    
   }
    
    //Facebook
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        self.lblTitle.text = "You have logged in!"
        self.lblMoreInfo.text = "This is where you perform a segue to another screen"
        println("User Logged In")
        println("This is where you perform a segue.")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        self.lblUserName.text = "Username: \(user.name)"
        println("User Name: \(user.name)")
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        self.lblTitle.text = "You have logged out"
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        self.lblMoreInfo.text = "Error: \(handleError.localizedDescription)"
        println("Error: \(handleError.localizedDescription)")
    }
    
}
