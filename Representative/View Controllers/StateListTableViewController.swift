//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Hannah Hoff on 3/21/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

        let state = States.all[indexPath.row]
        
        cell.textLabel?.text = state

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stateDetailSegue" {
        guard let destinationVC = segue.destination as? StateDetailTableViewController,
            let index = tableView.indexPathForSelectedRow else { return }
        
        destinationVC.state = States.all[index.row]
    }
    }
}
