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
            "detail":"I will take you to the sunglasses store and buy you any pair of Ray Bans that you like",
            "image":"raybans"
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
        ],
        [
            "name":"$50 at Victoria's Secret",
            "detail":"A $50.00 gift card to buy yourself something sexy \n Card No: 6006496922255307065 \n PIN: 9729",
            "image":"vsL",
            "image2":"barcode"
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
            let mar_5 = NSDate(timeIntervalSince1970: 1457200164.46394)
            if current_date.compare(mar_5) == NSComparisonResult.OrderedAscending {
                for var i = 0; i < gifts.count; i++ {
                    if let im2path = gifts[i]["image2"] {
                        let gift = Gift(imagePath: gifts[i]["image"]!, giftName: gifts[i]["name"]!, giftDesc: gifts[i]["detail"]!, im2p: im2path)
                        DataService.instance.addGift(gift)
                    } else {
                        let gift = Gift(imagePath: gifts[i]["image"]!, giftName: gifts[i]["name"]!, giftDesc: gifts[i]["detail"]!)
                        DataService.instance.addGift(gift)
                    }
                    
                }
                
            }
        }
    }

    override func viewDidAppear(animated: Bool) {
        collection.reloadData()
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
        let gift = DataService.instance.loadedGifts[indexPath.row]
        performSegueWithIdentifier("GiftDetailVC", sender: gift)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GiftDetailVC" {
            if let detailsVC = segue.destinationViewController as? GiftDetailVC {
                if let gift = sender as? Gift {
                    detailsVC.gift = gift
                }
            }
        }
    }
    
    func onGiftsLoaded(notif: AnyObject) {
        collection.reloadData()
    }
}

