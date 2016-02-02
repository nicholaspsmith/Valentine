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
    
    var gifts = [
        ["name":"1 Pair of Ray Bans","image":"raybanLogo"],
        ["name":"1 Bottle of Perfume","image":"perfume"],
        ["name":"1 Foot Rub","image":"foot_massage"],
        ["name":"1 Fancy Dinner","image":"dinner"],
        ["name":"1 Coffee Date","image":"coffee"]
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
}

