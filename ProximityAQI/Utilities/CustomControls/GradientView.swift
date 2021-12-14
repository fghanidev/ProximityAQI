//
//  GradientView.swift
//  ProximityAQI
//
//  Created by SYED FARAN GHANI on 12/12/21.
//


import UIKit

@IBDesignable class GradientView: UIView {
    
    private var gradientLayer: CAGradientLayer!
    
    private var topColor: UIColor = UIColor.Common.viewBackground
    private var bottomColor: UIColor = UIColor.Common.tint.withAlphaComponent(0.5)
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        self.gradientLayer = self.layer as? CAGradientLayer
        self.gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        self.gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        self.gradientLayer.endPoint = CGPoint(x: 0, y: 1)
    }
}
