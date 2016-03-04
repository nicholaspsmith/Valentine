//
//  Gift.swift
//  Valentine
//
//  Created by Nick on 2/1/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import Foundation

class Gift: NSObject, NSCoding {
    
    private var _giftName: String!
    private var _giftDesc: String!
    private var _imagePath: String!
    private var _used: Bool!
    private var _image2Path: String?
    
    var imagePath: String {
        return _imagePath
    }
    
    var image2Path: String? {
        return _image2Path
    }
    
    var giftName: String {
        return _giftName
    }
    
    var giftDesc: String {
        return _giftDesc
    }
    
    var used: Bool {
        get {
            return _used
        }
        set {
            _used = newValue
        }
    }
    
    init(imagePath: String, giftName: String, giftDesc: String) {
        super.init()
        
        self._imagePath = imagePath
        self._giftName = giftName
        self._giftDesc = giftDesc
    }
    
    init(imagePath: String, giftName: String, giftDesc: String, im2p: String) {
        super.init()

        self._imagePath = imagePath
        self._giftName = giftName
        self._giftDesc = giftDesc
        self._image2Path = im2p
        
    }
    
    override init() {}
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._giftName = aDecoder.decodeObjectForKey("giftName") as? String
        self._giftDesc = aDecoder.decodeObjectForKey("giftDesc") as? String
        self._image2Path = aDecoder.decodeObjectForKey("image2Path") as? String
    }
 
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._giftName, forKey: "giftName")
        aCoder.encodeObject(self._giftDesc, forKey: "giftDesc")
        aCoder.encodeObject(self._image2Path, forKey: "image2Path")
    }
}