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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func autoFill(_ sender: Any)
    {
        let newLift = Lifts()
        
        
        if let orm = Double(orpTextField.text!)
        {
            newLift.equalise(percent: 1, value: orm)
            
            ninetyTextField.text = "\(newLift.weights[1])";
            eightyTextField.text = "\(newLift.weights[2])";
            seventyTextField.text = "\(newLift.weights[3])";
            sixtyTextField.text = "\(newLift.weights[4])";
            fiftyTextField.text = "\(newLift.weights[5])";
        }
        
    }
    
    @IBAction func addLift(_ sender: Any)
    {
        //create a new instance of a lift to add to the array
        let newLift = Lifts()
        
        //get the name from the text field and add it to the array, then go back to the previous screen. Make sure all fields are filled
        if let name = liftTextField.text
        {
            if let orm = Double(orpTextField.text!),
                let ninety = Double(ninetyTextField.text!),
                let eighty = Double(eightyTextField.text!),
                let seventy = Double(seventyTextField.text!),
                let sixty = Double(sixtyTextField.text!),
                let fifty = Double(fiftyTextField.text!)
            {
                newLift.name = name
                newLift.weights[0] = orm
                newLift.weights[1] = ninety
                newLift.weights[2] = eighty
                newLift.weights[3] = seventy
                newLift.weights[4] = sixty
                newLift.weights[5] = fifty
                
                newLift.equalise(percent: 1, value: orm)
                //print(newLift.weights[1], " This is the newLift")
                    
                liftsTableVC?.lifts.append(newLift)
                liftsTableVC?.tableView.reloadData()
                navigationController?.popViewController(animated: true)
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: "Please fill all boxes", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
            
    }

}
