//
//  AddShelfViewController.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 7/2/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

protocol AddShelfViewControllerDelegate {
    func addShelf(addShelf: Shelf)
}

class AddShelfViewController: UIViewController, UITextFieldDelegate {

    var addShelfDelegate: AddShelfViewControllerDelegate! = nil
    var shelf = Shelf(shelfName: "shelfNameInAddShelfVC")
    
    @IBOutlet var addShelfTextField: UITextField
        
    override func viewDidLoad() {
            
        super.viewDidLoad()
        navigationItem.title = "Add Shelf Title"
    }
    
    @IBAction func saveAddShelfTitleButton(sender: UIBarButtonItem) {
            
        shelf.shelfName = addShelfTextField.text
        addShelfTextField.resignFirstResponder()
        addShelfDelegate.addShelf(shelf)
    }
        
    @IBAction func cancelAddShelfTitleButton(sender: UIBarButtonItem) {
            
        addShelfTextField.resignFirstResponder()
        navigationController.popViewControllerAnimated(true)
    }
        
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        
        self.view.endEditing(true)
    }
        
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
            
        textField.resignFirstResponder()
        return true
    }
}