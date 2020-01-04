//
//  ProgramViewController.swift
//  LiftEasy
//
//  Created by Colin White on 03/01/2020.
//  Copyright © 2020 Colin White. All rights reserved.
//

import UIKit

class ProgramViewController: UIViewController {

    @IBOutlet weak var addProgramButton: UIButton!
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!
    @IBOutlet weak var sundayButton: UIButton!
    
    
    var programsTableVC : ProgramsTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("we got this far")
        
        addProgramButton.layer.cornerRadius = 5
        
        mondayButton.layer.cornerRadius = 5
        mondayButton.layer.borderWidth = 1
        mondayButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        tuesdayButton.layer.cornerRadius = 5
        tuesdayButton.layer.borderWidth = 1
        tuesdayButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        wednesdayButton.layer.cornerRadius = 5
        wednesdayButton.layer.borderWidth = 1
        wednesdayButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        thursdayButton.layer.cornerRadius = 5
        thursdayButton.layer.borderWidth = 1
        thursdayButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        fridayButton.layer.cornerRadius = 5
        fridayButton.layer.borderWidth = 1
        fridayButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        saturdayButton.layer.cornerRadius = 5
        saturdayButton.layer.borderWidth = 1
        saturdayButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        sundayButton.layer.cornerRadius = 5
        sundayButton.layer.borderWidth = 1
        sundayButton.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
}
