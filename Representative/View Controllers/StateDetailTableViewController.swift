//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Hannah Hoff on 3/21/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var state: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = state
        if let state = state {
            RepresentativeController.searchRepresentatives(forState: state) { (repArray) in
                self.representatives = repArray
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }

        cell.representative = representatives[indexPath.row]
        
        return cell
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
