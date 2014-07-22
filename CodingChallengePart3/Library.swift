//
//  Library.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 6/22/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

// The library should be aware of a number of shelves.

import Foundation

var libraries = [Library]()
var shelves = [Shelf]()
var books = [Book]()

class Library: NSObject {

    var libraryName = String()
    var shelves = [Shelf]()

    init(libraryName: String) {
        self.libraryName = libraryName
        var shelves = [Shelf]()
    }

    // The library should have a method to report all books it contains.
    
//    func reportAllBooks() {
//        
//        var allBooks = String[]()
//        for shelf:Shelf in shelves {
//            for book:Book in shelf.books {
//                allBooks += book.bookTitle
//            }
//        }
//        var sortedAllBooks = sort(allBooks)
//        println("These libraries contain the following books: \(allBooks).")
//    }
}
