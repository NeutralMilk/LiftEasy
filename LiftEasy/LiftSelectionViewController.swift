//
//  LiftSelectionViewController.swift
//  LiftEasy
//
//  Created by Colin White on 04/01/2020.
//  Copyright © 2020 Colin White. All rights reserved.
//

import UIKit

class LiftSelectionViewController: UITableViewController {

    
    var lifts : [LiftEntity] = []
    var index = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        print("and here")
        
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let coreDataLiftEntities = try? context.fetch(LiftEntity.fetchRequest()) as? [LiftEntity]
            {
                lifts = coreDataLiftEntities
                tableView.reloadData()
            }
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
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
