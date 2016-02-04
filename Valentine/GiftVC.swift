//
//  SecondViewController.swift
//  Valentine
//
//  Created by Nick on 1/27/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class GiftVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var gifts: [[String:String]] = [
        [
            "name":"1 Pair of Ray Bans",
            "detail":"I will buy you any pair of Ray Bans that you like",
            "image":"raybanLogo"
        ],
        [
            "name":"1 Bottle Miss Dior - Blooming Bouquet",
            "detail":"I will buy you one bottle of Blooming Bouquet by Miss Dior at any time of your choosing.",
            "image":"missdior"
        ],
        [
            "name":"1 Foot Rub",
            "detail":"I will give you a 2 minute foot rub with my full attention at any time of your choosing",
            "image":"foot_massage"
        ],
        [
            "name":"1 Fancy Dinner",
            "detail":"I will take you out to a fancy dinner to a restaurant of your choice",
            "image":"dinner"
        ],
        [
            "name":"1 Coffee Date",
            "detail":"I will take you on a coffee date and not bring my iPhone, computer, or Apple Watch",
            "image":"coffee"
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        DataService.instance.loadGifts()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onGiftsLoaded:", name: "giftsLoaded", object: nil)
        
        if DataService.instance.loadedGifts.count == 0 {
            let current_date = NSDate()
            let feb_14 = NSDate(timeIntervalSince1970: 1455500164.46394)
            if current_date.compare(feb_14) == NSComparisonResult.OrderedAscending {
                for var i = 0; i < gifts.count; i++ {
                    let gift = Gift(imagePath: gifts[i]["image"]!, giftName: gifts[i]["name"]!, giftDesc: gifts[i]["detail"]!)
                    DataService.instance.addGift(gift)
                }
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.loadedGifts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let gift = DataService.instance.loadedGifts[indexPath.row]
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GiftCell", forIndexPath: indexPath) as? GiftCell {
            cell.configureCell(gift)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let gift = gifts[indexPath.row]
        performSegueWithIdentifier("GiftDetailVC", sender: gift)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GiftDetailVC" {
            if let detailsVC = segue.destinationViewController as? GiftDetailVC {
                if let gift = sender as? [String:String] {
                    detailsVC.gift = gift
                }
            }
        }
    }
    
    func onGiftsLoaded(notif: AnyObject) {
        collection.reloadData()
    }
}

