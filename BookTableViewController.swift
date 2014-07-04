//
//  BookTableViewController.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 6/22/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class BookTableViewController: UITableViewController, AddBookViewControllerDelegate {

    var shelf = Shelf(shelfName: "shelfNameInBookTableVC")
    var books = Book[]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.title = "Books"
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
        
    override func viewDidDisappear(animated: Bool) {
        
        shelf.books = books
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }

    // #pragma mark - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        
        return books.count
    }
    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell! {
        
        let cell: UITableViewCell = tableView!.dequeueReusableCellWithIdentifier("BookCell", forIndexPath: indexPath) as UITableViewCell
        
        let cellBook = books[indexPath!.row]
        cell.text = cellBook.bookTitle

        return cell
    }
    
//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
//
//        return true
//    }
    
//    override func tableView(tableView: UITableView?, editingStyleForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCellEditingStyle {
//        
//        if (indexPath!.row < books.count) {
//            return UITableViewCellEditingStyle.Delete
//        }
//            return UITableViewCellEditingStyle.Insert
//    }
    
//    override func setEditing(editing: Bool, animated: Bool) {
//        super.setEditing(true, animated: true)
//        tableView.setEditing(true, animated: true)
//        if (editing) {
//            addButton.enabled = false
//        } else {
//            addButton.enabled = true
//        }
//    }

    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
//        // Return NO if you do not want the specified item to be editable.
//        return true
//    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            books.removeAtIndex(indexPath!.row)
            tableView!.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        } else if editingStyle == UITableViewCellEditingStyle.Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//            books.insert(("books\(books.count + 1)"), atIndex[indexPath!.row])
//            books.append("books\(books.count + 1)")
//            tableView!.insertRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        }
    }
    
///// need to persist
//    // Override to support rearranging the table view.
//    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {
//        var bookToMove = books[fromIndexPath!.row]
//        var moveFrom = fromIndexPath!.row
//        var moveTo = toIndexPath!.row
//        
//        if (toIndexPath!.row < fromIndexPath!.row) {
//            moveFrom += 1
//        } else {
//            moveTo += 1
//        }
//        books.insert(bookToMove, atIndex: moveTo)
//        books.removeAtIndex(moveFrom)
//        println(books)
//    }
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath:NSIndexPath!) {
        
        var cellToMove = books[sourceIndexPath.row]
        books.removeAtIndex(sourceIndexPath.row)
        books.insert(cellToMove, atIndex: destinationIndexPath.row)
    }

//    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
//
//        return true
//    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    // #pragma mark - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "EditBookSegue" {
            
            let editBookVC = segue.destinationViewController as EditBookViewController
            var indexPath = tableView.indexPathForSelectedRow()
            var editBook:Book = books[indexPath.row]
            editBookVC.book = editBook

        } else if segue.identifier == "AddBookSegue" {
            
            let addBookVC = segue.destinationViewController as AddBookViewController
            addBookVC.addBookDelegate = self
        }
    }
    
    func addBook(addBook: Book) {
        
        books.append(addBook)
        tableView.reloadData()
        navigationController.popViewControllerAnimated(true)
    }
}
