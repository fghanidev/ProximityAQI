//
//  UIImageViewExtension.swift
//  ProximityAQI
//
//  Created by SYED FARAN GHANI on 12/12/21.
//


import Foundation
import UIKit

extension UIImageView {
    func makeCircle() {
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
}
