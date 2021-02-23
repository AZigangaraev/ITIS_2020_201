//
//  AddCityViewController.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class AddCityViewController: UITableViewController {

    
    private var cities: [City] = []
    
    private var viewModel: WeatherViewModel = WeatherViewModelImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.addAllCities = { [unowned self] in
            cities = $0
            tableView.reloadData()
        }
        
        viewModel.loadAllCities()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? CityCell else { return UITableViewCell() }
        
        cell.cityLabel.text = cities[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    
    

}
