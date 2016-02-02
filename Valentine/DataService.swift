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
        return _loadedPosts
    }
    
    private var _giftNumber: Int = 0

}