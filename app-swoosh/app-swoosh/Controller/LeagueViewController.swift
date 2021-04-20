//
//  LeagueViewController.swift
//  app-swoosh
//
//  Created by Jastin Martinez on 4/17/21.
//

import UIKit

class LeagueViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    var player = Player()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTapPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "skillViewControllerSegue", sender: self)
    }
    @IBAction func legueSelectionPressed(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle {
            player.legue = buttonTitle
            nextButton.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let skillViewControl = segue.destination as? SkillViewController {
            skillViewControl.player.legue = player.legue
        }
    }
}

