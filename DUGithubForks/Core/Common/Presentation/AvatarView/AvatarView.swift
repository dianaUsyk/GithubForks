//
//  AvatarView.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import UIKit

@IBDesignable
class AvatarView: UIView {
    private let lineWidth: CGFloat = 6.0
    private let photoLayer = CALayer()
    private let circleLayer = CAShapeLayer()
    
    private let maskLayer = CAShapeLayer()
    
    @IBInspectable
    var image: UIImage? {
        didSet {
            photoLayer.contents = image?.cgImage
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    var lineColor: UIColor = UIColor.standartLightBlueColor {
        didSet {
            circleLayer.strokeColor = lineColor.cgColor
        }
    }
    
    override func didMoveToWindow() {
        layer.addSublayer(circleLayer)
        photoLayer.mask = maskLayer
        layer.addSublayer(photoLayer)
    }
    
    override func layoutSubviews() {
        // Size the avatar image to fit
        photoLayer.frame = bounds
        
        updateCircle()
        
        // Size the layer
        maskLayer.path = circleLayer.path
    }
    
    private func updateCircle() {
        circleLayer.path = UIBezierPath(ovalIn: bounds).cgPath
        circleLayer.strokeColor = lineColor.cgColor
        circleLayer.lineWidth = lineWidth
        circleLayer.fillColor = UIColor.white.cgColor
    }
}
