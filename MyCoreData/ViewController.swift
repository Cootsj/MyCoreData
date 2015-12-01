//
//  ViewController.swift
//  MyCoreData
//
//  Created by Jeremy Coots on 11/30/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    var catalogdb:NSManagedObject!
    
    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBOutlet weak var game: UITextField!
    @IBOutlet weak var console: UITextField!
    @IBOutlet weak var location: UITextField!
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var btnback: UIBarButtonItem!

    
    @IBAction func btnSave(sender: AnyObject) {

        if (catalogdb != nil)
        {
            catalogdb.setValue(game.text, forKey: "game")
            catalogdb.setValue(console.text, forKey: "console")
            catalogdb.setValue(location.text, forKey: "location")
        }
        else
        {
            let entityDescription =
            NSEntityDescription.entityForName("Catalog",inManagedObjectContext: managedObjectContext)
            
            let catalog = Catalog(entity: entityDescription!,
                insertIntoManagedObjectContext: managedObjectContext)
            
            catalog.game = game.text!
            catalog.console = console.text!
            catalog.location = location.text!
        }
        var error: NSError?
        do {
            try managedObjectContext.save()
        } catch let error1 as NSError {
            error = error1
        }
        
        if let err = error {
            status.text = err.localizedFailureReason
        } else {
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (catalogdb != nil)
        {
            game.text = catalogdb.valueForKey("game") as? String
            console.text = catalogdb.valueForKey("console") as? String
            location.text = catalogdb.valueForKey("location") as? String
            btnsave.setTitle("Update", forState: UIControlState.Normal)
        }
        game.becomeFirstResponder()
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        //Adds tap gesture to view
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches , withEvent:event)
        if let touch = touches.first as UITouch! {
            DismissKeyboard()
        }
    }
    func DismissKeyboard(){
        //forces resign first responder and hides keyboard
        game.endEditing(true)
        console.endEditing(true)
        location.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool     {
        textField.resignFirstResponder()
        return true;
    }

}

