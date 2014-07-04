//
//  LibraryTableViewController.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 6/22/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController, AddLibraryViewControllerDelegate {

    override func viewDidLoad() {
    
        super.viewDidLoad()
        navigationItem.title = "Libraries"
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        entireLibrary()
//        reportAllBooks()
     }
    
//    func reportAllBooks() {
//        
//        var allBooks = String[]()
//        for shelf:Shelf in shelves {
//            for book:Book in shelf.books {
//                allBooks += book.bookTitle
//            }
//        }
//        var sortedAllBooks = sort(allBooks)
//        println("These libraries contain the following \(sortedAllBooks.count) books:\n")
//        var i = 1
//        for item in sortedAllBooks {
//            println("\(i). \(item)")
//            i++
//        }
//    }

    func entireLibrary() {
        
        let library1 = Library(libraryName: "Central Library")
        let library2 = Library(libraryName: "Montlake Branch")
        let library3 = Library(libraryName: "West Seattle Branch")
        
        libraries = [library1, library2, library3]
        
        let shelf1 = Shelf(shelfName: "Art History")
        let shelf2 = Shelf(shelfName: "Biography")
        let shelf3 = Shelf(shelfName: "Historical Fiction")
        let shelf4 = Shelf(shelfName: "Mystery")
        let shelf5 = Shelf(shelfName: "Romance")
        let shelf6 = Shelf(shelfName: "Science Fiction")
        let shelf7 = Shelf(shelfName: "Urban Fiction")
        
        libraries[0].shelves = [shelf1, shelf2, shelf3]
        libraries[1].shelves = [shelf4, shelf5]
        libraries[2].shelves = [shelf6, shelf7]
        
        // Art History
        let book1 = Book(bookTitle: "Beautiful Geometry")
        let book2 = Book(bookTitle: "Edward Hopper Paints His World")
        let book3 = Book(bookTitle: "History of Florence in Painting")
        let book4 = Book(bookTitle: "Michelangelo: His Life and Work")
        let book5 = Book(bookTitle: "Picasso and Chicago")
        // Biography
        let book6 = Book(bookTitle: "Beauty's Legacy: The Gilded Age")
        let book7 = Book(bookTitle: "I Know Why the Caged Bird Sings")
        let book8 = Book(bookTitle: "Piero Della Francesca")
        let book9 = Book(bookTitle: "Truth About Shakespeare")
        let book10 = Book(bookTitle: "Year of Reading Proust")
        // Historical Fiction
        let book11 = Book(bookTitle: "All Souls' Rising")
        let book12 = Book(bookTitle: "Crossroads")
        let book13 = Book(bookTitle: "Rebel")
        let book14 = Book(bookTitle: "Stone of the Builder")
        let book15 = Book(bookTitle: "Witch in the Well")
        // Mystery
        let book16 = Book(bookTitle: "Angelica's Smile")
        let book17 = Book(bookTitle: "House at Riverton: A Novel")
        let book18 = Book(bookTitle: "Invisible")
        let book19 = Book(bookTitle: "Murder on the Mediterranean")
        let book20 = Book(bookTitle: "Tempest in A Teapot")
        // Romance
        let book21 = Book(bookTitle: "Accidental Duchess")
        let book22 = Book(bookTitle: "Lady Windermere's Lover")
        let book23 = Book(bookTitle: "Millionaire Affair")
        let book24 = Book(bookTitle: "Scoundrel's Seduction")
        let book25 = Book(bookTitle: "Twisted")
        // Science Fiction
        let book26 = Book(bookTitle: "Cobra Slave")
        let book27 = Book(bookTitle: "Gilded Lily")
        let book28 = Book(bookTitle: "Moon Knight: Volumne 2")
        let book29 = Book(bookTitle: "Suicide Blonde")
        let book30 = Book(bookTitle: "Tomorrow and Tomorrow")
        // Urban Fiction
        let book31 = Book(bookTitle: "Coldhearted & Crazy")
        let book32 = Book(bookTitle: "Forty Acres: A Thriller")
        let book33 = Book(bookTitle: "Legacy: A Novel")
        let book34 = Book(bookTitle: "Rich Girl Problems")
        let book35 = Book(bookTitle: "Silver Bullets")

        libraries[0].shelves[0].books = [book1, book2, book3, book4, book5]
        libraries[0].shelves[1].books = [book6, book7, book8, book9, book10]
        libraries[0].shelves[2].books = [book11, book12, book13, book14, book15]
        
        libraries[1].shelves[0].books = [book16, book17, book18, book19, book20]
        libraries[1].shelves[1].books = [book21, book22, book23, book24, book25]
        
        libraries[2].shelves[0].books = [book26, book27, book28, book29, book30]
        libraries[2].shelves[1].books = [book31, book32, book33, book34, book35]

        // For reportAllBooks()
//        shelves += [shelf1, shelf2, shelf3, shelf4, shelf5, shelf6, shelf7]
//        books += [book1, book2, book3, book4, book5, book6, book7, book8, book9, book10, book11, book12, book13, book14, book15, book16, book17, book18, book19, book20, book21, book22, book23, book24, book25, book26, book27, book28, book29, book30, book31, book32, book33, book34, book35]
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {

        return libraries.count
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell! {
        
        let cell: UITableViewCell = tableView!.dequeueReusableCellWithIdentifier("LibraryCell", forIndexPath: indexPath) as UITableViewCell
        
        let cellLibrary = libraries[indexPath!.row]
        cell.text = cellLibrary.libraryName

        return cell
    }

//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
//
//        return true
//    }
    
    // Override to support editing the table view
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            libraries.removeAtIndex(indexPath!.row)
            tableView!.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        } else if (editingStyle == UITableViewCellEditingStyle.Insert) {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
//    override func tableView(tableView: UITableView!, editingStyleForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCellEditingStyle {
//        if (indexPath.row < libraries.count) {
//            return UITableViewCellEditingStyle.Delete
//        } else {
//            return UITableViewCellEditingStyle.Insert
//        }
//    }

//    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
//        if indexPath!.row == libraries.count {
//            return false
//        } else {
//            return true
//        }
//    }
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath:NSIndexPath!) {
        
        var cellToMove = libraries[sourceIndexPath.row]
        libraries.removeAtIndex(sourceIndexPath.row)
        libraries.insert(cellToMove, atIndex: destinationIndexPath.row)
    }

    // #pragma mark - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "ShelfSegue" {
            
            let shelfVC = segue.destinationViewController as ShelfTableViewController
            var indexPath = tableView.indexPathForSelectedRow()
            var library:Library = libraries[indexPath.row]
            shelfVC.shelves = library.shelves
            shelfVC.library = library
            
        } else if segue.identifier == "AddLibrarySegue" {
            
            let addLibraryVC = segue.destinationViewController as AddLibraryViewController
            addLibraryVC.addLibraryDelegate = self
        }
    }
    
    func addLibrary(addLibrary: Library) {
        
        libraries.append(addLibrary)
        tableView.reloadData()
        navigationController.popViewControllerAnimated(true)
    }
}