//
//  EditLiftViewController.swift
//  LiftEasy
//
//  Created by Colin White on 11/12/2019.
//  Copyright © 2019 Colin White. All rights reserved.
//

import UIKit

class EditLiftViewController: UIViewController {

    @IBOutlet weak var liftTextField: UITextField!
    @IBOutlet weak var ormTextField: UITextField!
    @IBOutlet weak var ninetyTextField: UITextField!
    @IBOutlet weak var eightyTextField: UITextField!
    @IBOutlet weak var seventyTextField: UITextField!
    @IBOutlet weak var sixtyTextField: UITextField!
    @IBOutlet weak var fiftyTextField: UITextField!
    @IBOutlet weak var updateLiftButton: UIButton!
    
    
    var liftsTableVC : LiftsTableViewController? = nil
    var newLift = Lifts()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateLiftButton.layer.cornerRadius = 5
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
        
        liftTextField.text = "\(newLift.name)"
        ormTextField.text = "\(newLift.weights[0])"
        ninetyTextField.text = "\(newLift.weights[1])"
        eightyTextField.text = "\(newLift.weights[2])"
        seventyTextField.text = "\(newLift.weights[3])"
        sixtyTextField.text = "\(newLift.weights[4])"
        fiftyTextField.text = "\(newLift.weights[5])"
        // Do any additional setup after loading the view.
    }

}
