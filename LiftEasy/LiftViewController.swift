//
//  LiftViewController.swift
//  LiftEasy
//
//  Created by Colin White on 07/12/2019.
//  Copyright © 2019 Colin White. All rights reserved.
//

import UIKit

class LiftViewController: UIViewController
{

    
    @IBOutlet weak var addLiftButton: UIButton!
    @IBOutlet weak var liftTextField: UITextField!
    @IBOutlet weak var orpTextField: UITextField!
    @IBOutlet weak var ninetyTextField: UITextField!
    @IBOutlet weak var eightyTextField: UITextField!
    @IBOutlet weak var seventyTextField: UITextField!
    @IBOutlet weak var sixtyTextField: UITextField!
    @IBOutlet weak var fiftyTextField: UITextField!
    
    var liftsTableVC : LiftsTableViewController? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        addLiftButton.layer.cornerRadius = 5
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func addLift(_ sender: Any)
    {
        //create a new instance of a lift to add to the array
        let newLift = Lifts()
        
        //get the name from the text field and add it to the array, then go back to the previous screen.
        if let name = liftTextField.text, let orm = Double(orpTextField.text!)
        {
            newLift.name = name
            newLift.orm  = orm
            newLift.equalise(percent: 1, value: orm)
            print(newLift.ninety, " This is the newLift")
                
            liftsTableVC?.lifts.append(newLift)
            liftsTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }

}
