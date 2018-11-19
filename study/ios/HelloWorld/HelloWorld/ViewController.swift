//
//  ViewController.swift
//  HelloWorld
//
//  Created by val on 8/21/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




@IBAction func showMessage() {
    let alertController = UIAlertController(title: "Welcome to my first app", message: "Hello world", preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    present(alertController, animated: true, completion: nil)

}
}
