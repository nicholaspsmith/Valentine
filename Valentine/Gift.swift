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
    
    var imagePath: String {
        return _imagePath
    }
    
    var giftName: String {
        return _giftName
    }
    
    var giftDesc: String {
        return _giftDesc
    }
    
    init(imagePath: String, giftName: String, giftDesc: String) {
        self._imagePath = imagePath
        self._giftName = giftName
        self._giftDesc = giftDesc
    }
    
    override init() {}
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._giftName = aDecoder.decodeObjectForKey("giftName") as? String
        self._giftDesc = aDecoder.decodeObjectForKey("giftDesc") as? String
    }
 
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._giftName, forKey: "giftName")
        aCoder.encodeObject(self._giftDesc, forKey: "giftDesc")
    }
}