//
//  ViewController.swift
//  WeatherApp
//
//  Created by ozlem on 22.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
    
}

//MARK: - UITextFieldDelegate
extension ViewController : UITextFieldDelegate{
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchTextField.endEditing(true)
            return true
        }
        
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            if textField.text != "" {
                return true
            } else {
                textField.placeholder = "Type something"
                return false
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            if let city = searchTextField.text {
                weatherManager.fetchWeather(cityName: city)
            }
            
            searchTextField.text = ""
            
        }
    }

//MARK: - WeatherManagerDelegate
extension ViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


