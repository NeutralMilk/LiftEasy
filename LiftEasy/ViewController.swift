//
//  ViewController.swift
//  LiftEasy
//
//  Created by Colin White on 07/12/2019.
//  Copyright © 2019 Colin White. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    
    @IBOutlet weak var liftButton: UIButton!
    @IBOutlet weak var programButton: UIButton!
    @IBOutlet weak var nutritionButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        liftButton.layer.cornerRadius = 5
        programButton.layer.cornerRadius = 5
        nutritionButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

