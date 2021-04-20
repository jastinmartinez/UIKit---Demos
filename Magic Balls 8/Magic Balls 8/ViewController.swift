//
//  ViewController.swift
//  Magic Balls 8
//
//  Created by Jastin Martinez on 2/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImageViewHolder: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askUIButton(_ sender: UIButton) {
        
        let picHolder = [#imageLiteral(resourceName: "ball2"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball2"),#imageLiteral(resourceName: "ball1"),#imageLiteral(resourceName: "ball4")]
        
        ballImageViewHolder.image = picHolder[Int.random(in: 0...4)]
        
    }
    
}

