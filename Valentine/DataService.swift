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
    
    
    // Gifts //
    
    let GIFTS_KEY = "gifts"
    private var _loadedGifts = [Gift]()
    
    var loadedGifts: [Gift] {
        get {
            return _loadedGifts
        }
        set {
            _loadedGifts = newValue
            self.saveGifts()
        }
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
    
    func addGift(gift: Gift) {
        _loadedGifts.append(gift)
        saveGifts()
        loadGifts()
    }
    
    func saveGifts() {
        let giftsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedGifts)
        NSUserDefaults.standardUserDefaults().setObject(giftsData, forKey: GIFTS_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadGifts() {
        if let giftsData = NSUserDefaults.standardUserDefaults().objectForKey(GIFTS_KEY) as? NSData {
            if let giftsArray = NSKeyedUnarchiver.unarchiveObjectWithData(giftsData) as? [Gift] {
                _loadedGifts = giftsArray
            }
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "giftsLoaded", object: nil))
    }
    
    
    // Memories //
    
    let MEMORIES_KEY = "memories"
    private var _loadedMemories = [String]()
    
    var loadedMemories: [String] {
        get {
            return _loadedMemories
        }
        set {
            _loadedMemories = newValue
            self.saveMemories()
        }
    }
    
    func addMemory(memory: String) {
        _loadedMemories.append(memory)
        saveMemories()
        loadMemories()
    }
    
    func saveMemories() {
        let memoriesData = NSKeyedArchiver.archivedDataWithRootObject(_loadedMemories)
        NSUserDefaults.standardUserDefaults().setObject(memoriesData, forKey: MEMORIES_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadMemories() {
        if let memoriesData = NSUserDefaults.standardUserDefaults().objectForKey(MEMORIES_KEY) as? NSData {
            if let memoriesArray = NSKeyedUnarchiver.unarchiveObjectWithData(memoriesData) as? [String] {
                _loadedMemories = memoriesArray
            }
        }
    }
    
    
    // File Manipulation Functions //
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        let imgData = UIImageJPEGRepresentation(image, 0.7)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }

    func documentsPathForFileName(name: String) -> String {
        // Images are stored in documents directory, not nsuserdefaults
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        // have to cast as NSString because it needs the following method
        return fullPath.stringByAppendingPathComponent(name)
    }
}