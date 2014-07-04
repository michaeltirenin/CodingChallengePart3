//
//  Shelf.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 6/22/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

// Each shelf should know what books it contains.

import Foundation

class Shelf: NSObject {
    
    var shelfName = String()
    var books = Book[]()
    
    init(shelfName: String) {
        self.shelfName = shelfName
        self.books = Book[]()
    }    
}