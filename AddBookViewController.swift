//
//  AddBookViewController.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 7/1/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

protocol AddBookViewControllerDelegate {
    func addBook(addBook: Book)
}

class AddBookViewController: UIViewController, UITextFieldDelegate {

    var addBookDelegate: AddBookViewControllerDelegate! = nil
    var book = Book(bookTitle: "bookTitleInAddBookVC")
        
    @IBOutlet var addBookTextField: UITextField
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.title = "Add A Book"
    }
    
    @IBAction func saveAddBookTitleButton(sender: UIBarButtonItem) {
        
        book.bookTitle = addBookTextField.text
        addBookTextField.resignFirstResponder()
        addBookDelegate.addBook(book)
    }
    
    @IBAction func cancelAddBookTitleButton(sender: UIBarButtonItem) {
        
        addBookTextField.resignFirstResponder()
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
