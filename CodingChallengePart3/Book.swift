//
//  Book.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 6/22/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

// Make the book object have “enshelf” and “unshelf” methods that control what shelf the book is sitting on.

import Foundation

class Book: NSObject {
    
    var bookTitle = String()
    var shelf:Shelf?
    
    
    init(bookTitle: String) {
        self.bookTitle = bookTitle
    }

//    func enshelf(shelf: Shelf) {
//        shelf.books.append(self)
//        self.shelf = shelf
//    }
//    
//    func unshelf(shelf: Shelf, index:Int) {
//        shelf.books.removeAtIndex(index)
//    }
}