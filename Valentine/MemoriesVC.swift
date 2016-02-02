//
//  MemoriesVC.swift
//  Valentine
//
//  Created by Nick on 2/1/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class MemoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var memories = [
        "Going to Enchanted Rock",
        "Going to New Orleans on a Whim",
        "Our first \"date\" to the Grocery Store",
        "Driving through Big Sur",
        "Taking NLP training together",
        "Exploring Richard Garriott's Castle",
        "Swimming at Balmoreah",
        "Hanging out all day at the beach in San Diego",
        "Camping in the Redwoods",
        "Going to the Rose Gardens in Portland"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MemoryCell") as? MemoryCell {
            cell.configureCell(memories[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Do Nothing
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memories.count
    }
}
