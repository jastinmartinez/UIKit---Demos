

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titileLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    let eggTimes = ["Soft": 3,"Medium":7, "Hard":12]
    var timer = Timer()
    var totalTime = 0, secondsPassed = 0
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titileLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer()
    {
        if(secondsPassed < totalTime)
        {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = Float(percentageProgress)
            
        }
        else {
            timer.invalidate()
            titileLabel.text = "Done!"
            playSound()
        }
    }
    
    func playSound() {
        let songPath = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: songPath!)
        player.play()
    }
}
