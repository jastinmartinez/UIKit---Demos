//
//  ViewController.swift
//  SegmentedWithImageAndText
//
//  Created by Jastin on 26/1/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        onCreate()
    }
    
    fileprivate func onCreate() {
        
        
        let names1 = ["Add","Remove"]
        
        let images1 = [CustomImageView(image: .add),CustomImageView(image: .remove)]
        
        let names2 = ["Actions","Checkmark"]
        
        let images2 = [CustomImageView(image: .actions),CustomImageView(image: .checkmark)]
        
        let textAndImageSegmentedControl1 = TextAndImageSegmentedControl(names: names1, images: images1)
        
        let textAndImageSegmentedControl2 = TextAndImageSegmentedControl(names: names2, images: images2)
        
        self.view.addSubview(textAndImageSegmentedControl1)
       
        self.view.addSubview(textAndImageSegmentedControl2)
        
        NSLayoutConstraint.activate([
        
            textAndImageSegmentedControl1.heightAnchor.constraint(equalToConstant: 100),
            textAndImageSegmentedControl1.widthAnchor.constraint(equalToConstant: 300),
            textAndImageSegmentedControl1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textAndImageSegmentedControl1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            textAndImageSegmentedControl2.topAnchor.constraint(equalTo: textAndImageSegmentedControl1.bottomAnchor,constant: 10),
            textAndImageSegmentedControl2.heightAnchor.constraint(equalToConstant: 100),
            textAndImageSegmentedControl2.widthAnchor.constraint(equalToConstant: 300),
            textAndImageSegmentedControl2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
        
        ])
    }
}

class CustomView : UIView {
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.translatesAutoresizingMaskIntoConstraints.toggle()
    }
}

class CustomSegmentedControl : UISegmentedControl {
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.translatesAutoresizingMaskIntoConstraints.toggle()
    }
}

class CustomImageView : UIImageView {
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.translatesAutoresizingMaskIntoConstraints.toggle()
    }
}

class TextAndImageSegmentedControl : CustomView {
    
    private var _segmentedControl = CustomSegmentedControl()
    
    private var _imageViews:[UIImageView] = []
    
    init(names:[String], images: [CustomImageView]) {
      
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        self.setSegmentedControl(names)
        
        self.setImageView(images)
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
    }
    
    fileprivate func setSegmentedControl(_ names: [String]) {
    
        _segmentedControl = CustomSegmentedControl(items: names)
        
        self.addSubview(_segmentedControl)
        
        NSLayoutConstraint.activate([
            
            _segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            _segmentedControl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1)
        ])
    }
    
    fileprivate func setImageView(_ imageViews: [CustomImageView]) {
        
        for (index,imageView) in imageViews.enumerated() {
            
            _segmentedControl.subviews[index].addSubview(imageView)
           
            setContrainstToImageView(index: index, imageView: imageView)
        }
    }
    
    fileprivate func setContrainstToImageView(index: Int,imageView: UIImageView) {
        
        NSLayoutConstraint.activate([
            
            imageView.heightAnchor.constraint(equalToConstant: 15),
            imageView.widthAnchor.constraint(equalToConstant: 15),
            imageView.leftAnchor.constraint(equalTo: _segmentedControl.subviews[index].leftAnchor,constant: CGFloat(index + 5)),
            imageView.centerYAnchor.constraint(equalTo: _segmentedControl.subviews[index].centerYAnchor),
        ])
    }
}

