//
//  WeatherCell.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    
    func configure(with forecast: WeatherForecast) {
        temperatureLabel.text = String(describing: forecast.temperature)
        dateLabel.text = String(describing: forecast.date)
        weatherIconImageView.image = forecast.weatherIcon
    }
    
}
