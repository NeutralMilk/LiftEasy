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
    var newLift : LiftEntity? = nil
    var index = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateLiftButton.layer.cornerRadius = 5
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        liftTextField.text = "\(String(describing: newLift!.name))"
        ormTextField.text = "\(newLift!.orm)"
        ninetyTextField.text = "\(newLift!.ninety)"
        eightyTextField.text = "\(newLift!.eighty)"
        seventyTextField.text = "\(newLift!.seventy)"
        sixtyTextField.text = "\(newLift!.sixty)"
        fiftyTextField.text = "\(newLift!.fifty)"
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func updateAuto(_ sender: Any)
    {
        if let orm = Double(ormTextField.text!)
        {
            //Lifts().equalise(value: orm)

            ormTextField.text = "\(rounding(value: orm))"
            ninetyTextField.text = "\(rounding(value: (orm * 0.9)))"
            eightyTextField.text = "\(rounding(value: (orm * 0.8)))"
            seventyTextField.text = "\(rounding(value: (orm * 0.7)))"
            sixtyTextField.text = "\(rounding(value: (orm * 0.6)))"
            fiftyTextField.text = "\(rounding(value: (orm * 0.5)))"
        }
    }
    
    @IBAction func updateLift(_ sender: Any)
    {
        //get the name from the text field and add it to the array, then go back to the previous screen. Make sure all fields are filled
        if let name = liftTextField.text, !liftTextField.text!.isEmpty,
            let orm = Double(ormTextField.text!),
            let ninety = Double(ninetyTextField.text!),
            let eighty = Double(eightyTextField.text!),
            let seventy = Double(seventyTextField.text!),
            let sixty = Double(sixtyTextField.text!),
            let fifty = Double(fiftyTextField.text!)
        {
            newLift!.name = name
            newLift!.orm = orm
            newLift!.ninety = ninety
            newLift!.eighty = eighty
            newLift!.seventy = seventy
            newLift!.sixty = sixty
            newLift!.fifty = fifty
            
            //Lifts().equalise(value: orm)
            navigationController?.popViewController(animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Please fill all boxes", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func removeLift(_ sender: Any)
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if newLift != nil
            {
                context.delete(newLift!)
                navigationController?.popViewController(animated: true)
            }
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
