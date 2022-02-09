//
//  ViewController.swift
//  XYZAccelerometer
//
//  Created by Jastin on 8/2/22.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        onCreate()
    }
    
    fileprivate func onCreate()
    {
        self.view.backgroundColor = .white
        
        let xLabel = labelMaker(text: "X:", color: .red)
        let yLabel = labelMaker(text: "Y:", color: .yellow)
        let zLabel = labelMaker(text: "Z:", color: .blue)
        
        startAccelerometerUpdates { _cMAccelerometerData in
            
            xLabel.text = "X:\(self.setNumberFormatter(_cMAccelerometerData.acceleration.x))"
            yLabel.text = "Y:\(self.setNumberFormatter(_cMAccelerometerData.acceleration.y))"
            zLabel.text = "Z:\(self.setNumberFormatter(_cMAccelerometerData.acceleration.z))"
        }
        
        let labelStackView = UIStackView(arrangedSubviews: [xLabel, yLabel, zLabel])
        
        setLabelStackViewConfiguation(labelStackView)
        setLabelStackViewConstraint(labelStackView)
    }
    
    fileprivate func setNumberFormatter(_ number: Double) -> String {
        
        let _numberFormatter = NumberFormatter()
        
        _numberFormatter.minimumFractionDigits = 1
        _numberFormatter.maximumFractionDigits = 1
        
        return _numberFormatter.string(for: number)!
    }
    
    fileprivate func startAccelerometerUpdates(completion: @escaping (CMAccelerometerData) -> () ) {
        
        motionManager.startAccelerometerUpdates(to: .main) { cMAccelerometerData, _ in
            
            guard let _cMAccelerometerData = cMAccelerometerData else { return }
            
            completion(_cMAccelerometerData)
        }
    }
    
    fileprivate func labelMaker(text: String, color: UIColor) -> UILabel
    {
        let _label = UILabel()
        
        _label.font = .systemFont(ofSize: 100)
        _label.textColor = color
        _label.text = text
        
        return _label
    }
    
    fileprivate func setLabelStackViewConfiguation(_ labelStackView: UIStackView) {
        
        labelStackView.alignment = .center
        labelStackView.axis = .vertical
        labelStackView.distribution = .fillEqually
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(labelStackView)
    }
    
    fileprivate func setLabelStackViewConstraint(_ labelStackView: UIStackView) {
        
        NSLayoutConstraint.activate([
            
            labelStackView.topAnchor.constraint(equalTo: self.view.topAnchor),
            labelStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            labelStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

