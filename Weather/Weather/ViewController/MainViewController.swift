//
//  MainViewController.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class MainViewController: UIViewController {

    var onFinishAdd: (() -> Void)?
    
    var onFinishWeather: (() -> Void)?
    
    @IBOutlet var tableView: UITableView!
    
    private var cities: [City] = []
    
    private var viewModel: WeatherViewModel = WeatherViewModelImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.cities = { [unowned self] in
            cities = $0
            tableView.reloadData()
        }
        viewModel.loadData()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func addCityButtonPressed(_ sender: UIButton) {
        onFinishAdd?()
        
        
           
    }
    
    
    

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? CityCell else { return UITableViewCell() }
        
        cell.cityLabel.text = cities[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteCity(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onFinishWeather?()
    }
}
