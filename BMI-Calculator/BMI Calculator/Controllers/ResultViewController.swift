

import UIKit

class ResultViewController: UIViewController {
    var bmi: BMI?
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmi?.value
        adviceLabel.text = bmi?.advice
        view.backgroundColor = bmi?.color
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
