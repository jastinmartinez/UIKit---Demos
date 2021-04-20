//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit


class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedWelcomeText()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func animatedWelcomeText()  {
        let charactersPlaceHolder = titleLabel.text
        titleLabel.text = ""
        var charIndex = 0.0
        if let _charactersPlaceHolder = charactersPlaceHolder {
            for character in _charactersPlaceHolder {
                Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) {
                    (Timer) in
                    self.titleLabel.text?.append(character)
                }
                charIndex += 1
            }
        }
    }
}
