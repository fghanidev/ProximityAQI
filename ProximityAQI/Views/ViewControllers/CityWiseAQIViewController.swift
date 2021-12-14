//
//  CityWiseAQIViewController.swift
//  ProximityAQI
//
//  Created by SYED FARAN GHANI on 12/12/21.
//

import UIKit

class CityWiseAQIViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private let viewModel = CitiesViewModel()
    
    var cities = [City]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        self.setupBindingAndGetCharacters()

        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    private func setupBindingAndGetCharacters() {
        //Binding
        viewModel.isBusy.bind { [unowned self] isBusy in
//            self.view.showLoader(show: isBusy)
        }
        
        viewModel.cityList.bind { (cityList) in
            
        }
        
        viewModel.error.bind { [unowned self] (error) in
            if let error = error {
                UIAlertController.show(error.localizedDescription, from: self)
            }
        }
        
        viewModel.getCityWiseAQI(completion: { cities in
            
            DispatchQueue.main.async {
                
                self.cities = cities
                self.tableView.reloadData()
            }
            
        })
    }

}


// MARK: - UITableView Data Source
extension CityWiseAQIViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "cityCell") as? CityListTableViewCell else {
            fatalError("Unable to dequeue characterTableViewCell.")
        }
        
        cell.config(city: cities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
}

extension CityWiseAQIViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let aqiChartVC = self.storyboard?.instantiateViewController(withIdentifier: "AQIChartViewController") as! AQIChartViewController

        aqiChartVC.city = cities[indexPath.row]

        self.navigationController?.pushViewController(aqiChartVC, animated: true)
    }
}
