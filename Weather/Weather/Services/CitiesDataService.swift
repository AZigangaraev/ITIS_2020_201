//
//  CitiesDataService.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import Foundation

class CitiesDataService {
    var activeCities = [
        City(name: "Kazan"),
        City(name: "Moscow"),
        City(name: "Saint Petersburg"),
    ]
    
    var allCities = [
        City(name: "Kazan"),
        City(name: "Moscow"),
        City(name: "Saint Petersburg"),
        City(name: "Vladivostok"),
        City(name: "Krasnoyarsk"),
        City(name: "Novosibirsk"),
        City(name: "Ekaterinburg"),
        City(name: "Izhevsk"),
        City(name: "Krasnodar"),
        City(name: "Arkhangelsk"),
        City(name: "Orel"),
    ]
    
    func addCity(index: Int) -> [City] {
        if !activeCities.contains(allCities[index]) {
            activeCities.append(allCities[index])
        }
        return activeCities
    }
    
    func deleteCity(index: Int) -> [City] {
        activeCities.remove(at: index)
        return activeCities
    }
    
    
}
