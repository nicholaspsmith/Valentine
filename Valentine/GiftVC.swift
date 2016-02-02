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
            "name":"1 Bottle of Perfume",
            "detail":"I will buy you that perfume that you want but can't seem to remember the name of",
            "image":"perfume"
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GiftCell", forIndexPath: indexPath) as? GiftCell {
            cell.configureCell(gifts[indexPath.row]["image"]!, label: gifts[indexPath.row]["name"]!)
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
}

