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

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func addLift(_ sender: Any)
    {
        let newLift = Lifts()
        
        if let name = liftTextField.text
        {
            newLift.name = name
            liftsTableVC?.lifts.append(newLift)
            liftsTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }

}
