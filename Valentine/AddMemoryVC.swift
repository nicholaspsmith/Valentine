//
//  AddMemoryVC.swift
//  Valentine
//
//  Created by Nick on 2/11/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class AddMemoryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
