//
//  AddLibraryViewController.swift
//  CodingChallengePart2
//
//  Created by Michael Tirenin on 7/2/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

protocol AddLibraryViewControllerDelegate {
    func addLibrary(addLibrary: Library)
}

class AddLibraryViewController: UIViewController, UITextFieldDelegate {

    var addLibraryDelegate: AddLibraryViewControllerDelegate! = nil
    var library = Library(libraryName: "libraryNameInAddLibraryVC")
    
    @IBOutlet var addLibraryTextField: UITextField?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.title = "Add A Library"
    }
    
    @IBAction func saveAddLibraryNameButton(sender: UIBarButtonItem) {
        
        library.libraryName = addLibraryTextField!.text
        addLibraryTextField!.resignFirstResponder()
        addLibraryDelegate.addLibrary(library)
    }
    
    @IBAction func cancelAddLibraryNameButton(sender: UIBarButtonItem) {
        
        addLibraryTextField!.resignFirstResponder()
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