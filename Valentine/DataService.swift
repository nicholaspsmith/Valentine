//
//  DataService.swift
//  Valentine
//
//  Created by Nick on 2/1/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    let GIFTS_KEY = "gifts"
    private var _loadedGifts = [Gift]()
    
    var loadedPosts: [Gift] {
        return _loadedGifts
    }
    
    private var _giftNumber: Int = 0
    
    var giftNumber: Int {
        get {
            return _giftNumber
        }
        set {
            _giftNumber = newValue
        }
    }
    
    func savePosts() {
        let giftsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedGifts)
        NSUserDefaults.standardUserDefaults().setObject(giftsData, forKey: GIFTS_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        if let giftsData = NSUserDefaults.standardUserDefaults().objectForKey(GIFTS_KEY) as? NSData {
            if let giftsArray = NSKeyedUnarchiver.unarchiveObjectWithData(giftsData) as? [Gift] {
                _loadedGifts = giftsArray
            }
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "giftsLoaded", object: nil))
    }
    
    

}