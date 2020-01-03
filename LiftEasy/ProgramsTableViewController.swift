//
//  ProgramsTableViewController.swift
//  LiftEasy
//
//  Created by Colin White on 07/12/2019.
//  Copyright © 2019 Colin White. All rights reserved.
//

import UIKit

class ProgramsTableViewController: UITableViewController
{

    var programs : [Programs] = []
    var index = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let coreDataPrograms = try? context.fetch(Programs.fetchRequest()) as? [Programs]
            {
                programs = coreDataPrograms
                tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return programs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        let program = programs[indexPath.row]
        
        cell.textLabel?.text = program.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedLift = programs[indexPath.row]
        index = indexPath.row
        performSegue(withIdentifier: "goToEditLift", sender: selectedLift)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if let programVC = segue.destination as? ProgramViewController
        {
            programVC.programsTableVC = self
        }
        
//        if let editProgramVC = segue.destination as? EditLiftViewController
//        {
//            if let selectedLift = sender as? LiftEntity
//            {
//                editLiftVC.newLift = selectedLift
//                editLiftVC.liftsTableVC = self
//                editLiftVC.index = index
//            }
//
//        }
    }

}
