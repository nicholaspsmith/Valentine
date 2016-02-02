//
//  GiftDetailVC.swift
//  Valentine
//
//  Created by Nick on 2/1/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class GiftDetailVC: UIViewController {

    var gift: [String:String]!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var giftName: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: "tripleTapped")
        tap.numberOfTapsRequired = 3
        view.addGestureRecognizer(tap)
        
        giftName.text = gift["name"]
        detail.text = gift["detail"]
        imageView.image = UIImage(named: gift["image"]!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
 
    func tripleTapped() {
        // @TODO remove this gift from DataSource
        let gifts = DataService.instance.loadedGifts
        var newGifts = [Gift]()
        for var i = 0; i < gifts.count; i++ {
            let name = gifts[i].giftName
            if name != self.gift["name"] {
                newGifts.append(gifts[i])
            }
        }
        DataService.instance.loadedGifts = newGifts
        DataService.instance.loadGifts()
        dismissViewControllerAnimated(true, completion: nil)
    }
}
