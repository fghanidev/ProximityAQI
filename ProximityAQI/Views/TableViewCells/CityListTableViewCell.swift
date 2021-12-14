//
//  CityListTableViewCell.swift
//  ProximityAQI
//
//  Created by SYED FARAN GHANI on 12/12/21.
//

import UIKit

class CityListTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var citiesLabel: UILabel!
    @IBOutlet weak var currentAQILabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.baseView.layer.cornerRadius = 5.0
        self.baseView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(city: City){
        
        let viewModel = CityViewModel(city: city)
        
        self.citiesLabel.text = viewModel.name
        self.currentAQILabel.text =  String.init(format: "%.2f", viewModel.aqi)
        self.lastUpdatedLabel.text = viewModel.updatedDate.timeAgoSince()
        self.baseView.backgroundColor = aqiWiseColor(aqi: viewModel.aqi)
    }
    
    func aqiWiseColor(aqi: Double) -> UIColor{
        
        switch aqi {
        case 0 ... 50:
            return UIColor.Common.good
        case 51 ... 100:
            return UIColor.Common.satisfactory
        case 101 ... 200:
            return UIColor.Common.moderate
        case 201 ... 300:
            return UIColor.Common.poor
        case 301 ... 400:
            return UIColor.Common.veryPoor
        case 401 ... 500:
            return UIColor.Common.severe
        default:
            return UIColor.Common.viewBackground

        }
    }
}
