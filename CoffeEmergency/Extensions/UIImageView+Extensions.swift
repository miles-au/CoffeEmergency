//
//  UIImageView+Extensions.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL) {
        // set image to nil while downloading. Reusable cells will show old images otherwise
        self.image = nil
        
        // create loading view
        let _ = self.loadingView
        animateLoadingView()
        
        // download image
        UIImage.downloaded(from: url, completion: updateImage(image:))
    }
    
    func downloaded(from link: String) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url)
    }
    
    func updateImage(image: UIImage){
        DispatchQueue.main.async {
            self.loadingCircleLayer?.removeAllAnimations()
            self.loadingCircleLayer?.removeFromSuperlayer()
            self.image = image
        }
    }
}

// MARK: - Loading Animation on download
extension UIImageView{
    /// while image is downloading, show a rotating loading animation
    var loadingView: UIView {
        var loadingView = UIView()
        
        if let existingView = self.subviews.first{
            loadingView = existingView
        }else{
            // add loading view before setting constraints
            self.addSubview(loadingView)
        }
        
        // set up animated circle line
        let circleLayer = CAShapeLayer()
        circleLayer.fillColor = nil
        circleLayer.strokeColor = UIColor(named: "BrandLightBrown")?.cgColor
        circleLayer.lineWidth = 8
        let circleDiameter = bounds.height * 0.4
        let circleSize = CGSize(width: circleDiameter, height: circleDiameter)
        circleLayer.path = UIBezierPath(ovalIn: CGRect(origin: CGPoint.zero, size: circleSize)).cgPath
        
        // move anchor point to the middle of the circle
        if let path = circleLayer.path {
            circleLayer.bounds = path.boundingBox
        }
        
        // don't draw circle yet
        circleLayer.strokeEnd = 0
        
        // move circle to center with constraints
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        // add circle layer
        loadingView.layer.addSublayer(circleLayer)
        
        return loadingView
    }
    
    var loadingCircleLayer: CAShapeLayer?{
        if let circleLayer = loadingView.layer.sublayers?.first(where: {$0 is CAShapeLayer}) as? CAShapeLayer{
            return circleLayer
        }else{
            return nil
        }
    }
    
    func animateLoadingView() {
        guard let loadingCircleLayer = loadingCircleLayer else { return }
        
        // Animation is 2 parts
        // 1. Animate circle from 0 to 1 clockwise
        let firstHalf = animationFirstHalf()
        // 2. Rotate the circle WHILE the circle is reversing the first animation.
        let secondHalf = animationSecondHalf()
        let rotate = rotateLoadingCircle()
        
        // Package the whole animation
        let animation = CAAnimationGroup()
        animation.duration = 2.0
        animation.animations = [firstHalf, rotate, secondHalf]
        
        // Repeat forever
        animation.repeatDuration = Double.infinity
        
        // run animation
        loadingCircleLayer.add(animation, forKey: "animateCircle")
    }
    
    func animationFirstHalf() -> CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        
        return animation
    }
    
    func animationSecondHalf() -> CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1
        animation.beginTime = 1
        
        return animation
    }
    
    func rotateLoadingCircle() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.byValue = Double.pi * 2
        animation.duration = 1
        animation.beginTime = 1
        
        return animation
    }
}
