//
//  ViewExtension.swift
//  AutoLayout
//
//  Created by jahidul islam on 1/8/24.
//

import Foundation
import UIKit

extension UIView {
    
    public func ApplyCorner (CornerRadius: Double,BorderWidth: Double, BorderColor: UIColor) {
            self.layer.borderColor = BorderColor.cgColor
            self.layer.cornerRadius = CornerRadius
            self.layer.borderWidth = BorderWidth
            self.clipsToBounds = true
    }
    
    public func BorderWithShadow (CornerRadius: Double,BorderWith: Double, BorderColor: UIColor,ShadowRadius: Double,ShadowOpacity: Float,ShadowOffset: CGSize) {
        self.layer.borderColor = BorderColor.cgColor
        self.layer.borderWidth = BorderWith
        self.layer.cornerRadius = CornerRadius
        self.layer.shadowColor = BorderColor.cgColor
        self.layer.shadowOpacity = ShadowOpacity
        self.layer.shadowOffset = ShadowOffset
        self.layer.shadowRadius = ShadowRadius
        self.layer.masksToBounds = false
    }
    
    public func ApplyShadow (ShadowRadius: Double,ShadowOpacity: Float,ShadowOffset: CGSize,ShadowColor: UIColor) {
        self.layer.shadowColor = ShadowColor.cgColor
        self.layer.shadowOpacity = ShadowOpacity
        self.layer.shadowOffset = ShadowOffset
        self.layer.shadowRadius = ShadowRadius
        self.layer.masksToBounds = false
    }
}
