//
//  ViewController.swift
//  hustle-mode
//
//  Created by Jastin Martinez on 4/15/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBg: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var cloudView: UIView!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var rocketImage: UIImageView!
    var  player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }
        catch let error as NSError {
            print(error.description)
        }
        
    }
    
    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudView.isHidden = false
        darkBlueBg.isHidden = true
        powerButton.isHidden = true
        player.play()
        UIView.animate(withDuration: 2.3) {
            self.rocketImage.frame = CGRect(x: 0, y: 20, width: 375, height: 400)
        } completion: { (finished) in
            self.hustleLabel.isHidden = false
            self.onLabel.isHidden = false
        }
    }
}

