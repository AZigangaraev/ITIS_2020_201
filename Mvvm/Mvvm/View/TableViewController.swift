//
//  TableViewController.swift
//  Mvvm
//
//  Created by Nail on 21.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var viewModel: TableViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.numbersOfRows ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel

        return tableViewCell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         guard let viewModel = viewModel else { return }
         viewModel.selectRow(atIndexPath: indexPath)
               
         performSegue(withIdentifier: "segue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let destinationVc = segue.destination as? ViewController {
                destinationVc.viewModel = viewModel?.viewModelForRow()
            }
            
        }
    }
}
