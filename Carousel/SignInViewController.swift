//
//  SignInViewController.swift
//  Carousel
//
//  Created by Teus on 10/15/15.
//  Copyright © 2015 Teus. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    @IBAction func didPressButton(sender: AnyObject) {
        if email.text!.isEmpty
      
        {
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            
            
            presentViewController(alertController, animated: true){}
            alertController.addAction(OKAction)
            // optional code for what happens after the alert controller has finished presenting
        }
        
        
        if password.text!.isEmpty
        {
            let alertController = UIAlertController(title: "Password Required", message: "Please enter your Password", preferredStyle: .Alert)
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            
            
            presentViewController(alertController, animated: true){}
            alertController.addAction(OKAction)
            // optional code for what happens after the alert controller has finished presenting
        }
    
        
        
        if email.text != "mcoelho@walmart.com" || password.text != "password"
            
        {
            
            self.activityIndicator.startAnimating()
            delay(2)
                {let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid Email or Password", preferredStyle: .Alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        
                    }
            self.presentViewController(alertController, animated: true){}
            alertController.addAction(OKAction)
            self.activityIndicator.stopAnimating()
            }
        
        }
        if email.text == "mcoelho@walmart.com" && password.text == "password"
        {
            self.activityIndicator.startAnimating()
            delay(2){
            self.performSegueWithIdentifier("segueToTutorial", sender: nil)}
        
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func keyboardWillShow(notification: NSNotification!) {
      
        scrollView.contentOffset.y = 0
        buttonView.transform = CGAffineTransformMakeTranslation( 0, -214)
  
    }
    func keyboardWillHide(notification: NSNotification!) {
        buttonView.transform = CGAffineTransformMakeTranslation( 0, +214)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    

}
