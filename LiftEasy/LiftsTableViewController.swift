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

    var lifts : [LiftEntity] = []
    var index = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let coreDataLiftEntities = try? context.fetch(LiftEntity.fetchRequest()) as? [LiftEntity]
            {
                lifts = coreDataLiftEntities
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedLift = lifts[indexPath.row]
        index = indexPath.row
        performSegue(withIdentifier: "goToEditLift", sender: selectedLift)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if let liftVC = segue.destination as? LiftViewController
        {
            liftVC.liftsTableVC = self
        }
        
        if let editLiftVC = segue.destination as? EditLiftViewController
        {
            if let selectedLift = sender as? LiftEntity
            {
                editLiftVC.newLift = selectedLift
                editLiftVC.liftsTableVC = self
                editLiftVC.index = index
            }
            
        }
    }
}
