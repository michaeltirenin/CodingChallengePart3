//
//  EditBookViewController.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 6/22/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class EditBookViewController: UIViewController, UITextFieldDelegate {
    
    var book = Book(bookTitle: "bookTitleInEditBookVC")

    @IBOutlet var editBookTextField: UITextField
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.title = "Edit Book Title"
        editBookTextField.text = book.bookTitle
    }

    @IBAction func saveBookTitleButton(sender: UIBarButtonItem) {

        book.bookTitle = editBookTextField.text
        editBookTextField.resignFirstResponder()
        navigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func cancelBookTitleButton(sender: UIBarButtonItem) {
        
        editBookTextField.resignFirstResponder()
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
