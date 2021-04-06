//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import Foundation

protocol WeatherViewModel {
    var cities: (([City]) -> Void)? { get set }
    var addAllCities: (([City]) -> Void)? {get set}
    
    func loadData()
    func loadAllCities()
    func addCity(index: Int)
    func deleteCity(index: Int)
}

class WeatherViewModelImplementation: WeatherViewModel {
    private let citiesServices: CitiesDataService = CitiesDataService()
    private var activeCities: [City] = []
    private var allCities: [City] = []
    var cities: (([City]) -> Void)?
    var addAllCities: (([City]) -> Void)?
    
    func loadData() {
        activeCities = citiesServices.activeCities
        cities?(activeCities)
    }
    
    func loadAllCities() {
        allCities = citiesServices.allCities
        addAllCities?(allCities)
    }
    
    func addCity(index: Int) {
        activeCities = citiesServices.addCity(index: index)
        cities?(activeCities)
    }
    
    func deleteCity(index: Int) {
        activeCities = citiesServices.deleteCity(index: index)
        cities?(activeCities)
    }
    
}
