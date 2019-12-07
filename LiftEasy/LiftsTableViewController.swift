//
//  LiftsTableViewController.swift
//  LiftEasy
//
//  Created by Colin White on 07/12/2019.
//  Copyright © 2019 Colin White. All rights reserved.
//

import UIKit

class LiftsTableViewController: UITableViewController
{

    var lifts : [Lifts] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        let lift = lifts[indexPath.row]
        
        cell.textLabel?.text = lift.name
        
        return cell
    }
    
}
