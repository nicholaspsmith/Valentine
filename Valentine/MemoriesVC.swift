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
    
    var default_memories = [
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
        
        DataService.instance.loadMemories()
        
        if DataService.instance.loadedMemories.count == 0 {
            let current_date = NSDate()
            let feb_14 = NSDate(timeIntervalSince1970: 1455500164.46394)
            if current_date.compare(feb_14) == NSComparisonResult.OrderedAscending {
                for var i = 0; i < default_memories.count; i++ {
                    DataService.instance.addMemory(default_memories[i])
                }
            }
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onMemoriesLoaded:", name: "memoriesLoaded", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let memories = DataService.instance.loadedMemories
        
        if indexPath.row < memories.count {
            let memory = memories[indexPath.row]
            if let cell = tableView.dequeueReusableCellWithIdentifier("MemoryCell") as? MemoryCell {
                cell.configureCell(memory)
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            if let cell = tableView.dequeueReusableCellWithIdentifier("AddMemoryCell") as? AddMemoryCell {
                return cell
            } else {
                return UITableViewCell()
            }
        }

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Do Nothing
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedMemories.count + 1
    }
    
    func onMemoriesLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
}
