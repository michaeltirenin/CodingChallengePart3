//
//  ShelfTableViewController.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 6/22/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class ShelfTableViewController: UITableViewController, AddShelfViewControllerDelegate {

    var library = Library(libraryName: "libraryNameInShelfTableVC")
    var shelves = Shelf[]()
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.title = "Shelves"
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        library.shelves = shelves
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }

    // #pragma mark - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        
        return shelves.count
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell! {
        
        let cell: UITableViewCell = tableView!.dequeueReusableCellWithIdentifier("ShelfCell", forIndexPath: indexPath) as UITableViewCell
        
        let cellShelf = shelves[indexPath!.row]
        cell.text = cellShelf.shelfName
        
        return cell
    }

//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
//
//        return true
//    }
    
    // Override to support editing the table view
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            shelves.removeAtIndex(indexPath!.row)
            tableView!.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        } else if editingStyle == UITableViewCellEditingStyle.Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath:NSIndexPath!) {
        
        var cellToMove = shelves[sourceIndexPath.row]
        shelves.removeAtIndex(sourceIndexPath.row)
        shelves.insert(cellToMove, atIndex: destinationIndexPath.row)
    }

    
//    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
//        // Return NO if you do not want the item to be re-orderable.
//        return true
//    }
    
    
    // #pragma mark - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "BookSegue" {
            
            let bookVC = segue.destinationViewController as BookTableViewController
            var indexPath = tableView.indexPathForSelectedRow()
            var shelf:Shelf = shelves[indexPath.row]
            bookVC.books = shelf.books
            bookVC.shelf = shelf
            
        } else if segue.identifier == "AddShelfSegue" {
            
            let addShelfVC = segue.destinationViewController as AddShelfViewController
            addShelfVC.addShelfDelegate = self
        }
    }
    
    func addShelf(addShelf: Shelf) {
        
        self.shelves.append(addShelf)
        tableView.reloadData()
        navigationController.popViewControllerAnimated(true)
    }
}
