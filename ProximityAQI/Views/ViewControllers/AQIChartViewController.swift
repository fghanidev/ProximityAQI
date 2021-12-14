//
//  AQIChartViewController.swift
//  ProximityAQI
//
//  Created by SYED FARAN GHANI on 12/12/21.
//

import UIKit

class AQIChartViewController: UIViewController {

    @IBOutlet weak var gaugeView: SmartGauge!
    
    @IBOutlet weak var good: UIView!
    @IBOutlet weak var satisfactory: UIView!
    @IBOutlet weak var moderate: UIView!
    @IBOutlet weak var poor: UIView!
    @IBOutlet weak var veryPoor: UIView!
    @IBOutlet weak var severe: UIView!
    
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupGaugeView()
        setAQIViewColor()
        self.title = city?.name

    }
    

    func setupGaugeView() {
        gaugeView.numberOfMajorTicks = 6
        gaugeView.numberOfMinorTicks = 2
        
        gaugeView.gaugeAngle = 60
        gaugeView.gaugeValue = CGFloat((city?.aqi)!)
        gaugeView.valueFont = UIFont.systemFont(ofSize: 10, weight: .thin)
        gaugeView.gaugeTrackColor = UIColor.blue
        gaugeView.enableLegends = false
        gaugeView.gaugeViewPercentage = 0.8
        gaugeView.legendSize = CGSize(width: 25, height: 20)
        if let font = CTFontCreateUIFontForLanguage(.system, 30.0, nil) {
            gaugeView.legendFont = font
        }
        gaugeView.coveredTickValueColor = UIColor.darkGray
        
        let first = SGRanges("0 - 50", fromValue: 0, toValue: 50, color: UIColor.Common.good)
        let second = SGRanges("51 - 100", fromValue: 50, toValue: 100, color: UIColor.Common.satisfactory)
        let third = SGRanges("101 - 200", fromValue: 100, toValue: 200, color: UIColor.Common.moderate)
        let fourth = SGRanges("201 - 300", fromValue: 200, toValue: 300, color: UIColor.Common.poor)
        let fifth = SGRanges("301 - 400", fromValue: 300, toValue: 400, color: UIColor.Common.veryPoor)
        let sixth = SGRanges("401 - 500", fromValue: 400, toValue: 500, color: UIColor.Common.severe)
        
        gaugeView.rangesList = [first, second, third, fourth, fifth, sixth]
        gaugeView.gaugeMaxValue = sixth.toValue
        gaugeView.enableRangeColorIndicator = true
    }
    
    func setAQIViewColor(){
        
        good.backgroundColor = UIColor.Common.good
        satisfactory.backgroundColor = UIColor.Common.satisfactory
        moderate.backgroundColor = UIColor.Common.moderate
        poor.backgroundColor = UIColor.Common.poor
        veryPoor.backgroundColor = UIColor.Common.veryPoor
        severe.backgroundColor = UIColor.Common.severe
    }

}
