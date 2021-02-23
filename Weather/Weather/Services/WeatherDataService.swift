//
//  WeatherDataService.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class WeatherDataService {
    
    let weather = WeatherForecast(temperature: Double.random(in: -24...24).rounded(), date: Date(), weatherIcon: UIImage(systemName: "cloud.sun.fill"))
    
    func getWeather() -> UICollectionViewCell {
        guard let cell = UICollectionViewCell() as? WeatherCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: weather)
        return cell 
    }
}
