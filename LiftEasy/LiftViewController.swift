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
    //var newLift : LiftEntity? = nil

    
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
        
        if let orm = Double(orpTextField.text!)
        {
            orpTextField.text = "\(rounding(value: orm))"
            ninetyTextField.text = "\(rounding(value: (orm * 0.9)))"
            eightyTextField.text = "\(rounding(value: (orm * 0.8)))"
            seventyTextField.text = "\(rounding(value: (orm * 0.7)))"
            sixtyTextField.text = "\(rounding(value: (orm * 0.6)))"
            fiftyTextField.text = "\(rounding(value: (orm * 0.5)))"
        }
    }
    
    @IBAction func addLift(_ sender: Any)
    {
        //get the name from the text field and add it to the array, then go back to the previous screen. Make sure all fields are filled
        if let name = liftTextField.text, !liftTextField.text!.isEmpty,
            var orm = Double(orpTextField.text!),
            var ninety = Double(ninetyTextField.text!),
            var eighty = Double(eightyTextField.text!),
            var seventy = Double(seventyTextField.text!),
            var sixty = Double(sixtyTextField.text!),
            var fifty = Double(fiftyTextField.text!)
        {

            orm = rounding(value: orm)
            ninety = rounding(value: ninety)
            eighty = rounding(value: eighty)
            seventy = rounding(value: seventy)
            sixty = rounding(value: sixty)
            fifty = rounding(value: fifty)
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
            {
                let newLift = LiftEntity(context: context)
                newLift.name = name
                newLift.orm = rounding(value: orm)
                newLift.ninety = rounding(value: (orm * 0.9))
                newLift.eighty = rounding(value: (orm * 0.8))
                newLift.seventy = rounding(value: (orm * 0.7))
                newLift.sixty = rounding(value: (orm * 0.6))
                newLift.fifty = rounding(value: (orm * 0.5))
                
                print(newLift)
            }
            navigationController?.popViewController(animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Please fill all boxes", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func rounding(value: Double) -> Double
    {
        var value = value
        
        //round to nearest 2.5
        value = value / 2.5
        value.round()
        value = value * 2.5
        
        return value
    }
}
