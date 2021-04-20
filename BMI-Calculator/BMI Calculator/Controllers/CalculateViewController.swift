

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    var calculator = Calculator()
    let heightUnit = "m"
    let weightUnit = "Kg"
    override func viewDidLoad() {
        super.viewDidLoad()
        weightLabel.text = "\(calculator)\(weightUnit)"
    }
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
       let height  = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)\(heightUnit)"
    }
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text  = "\(weight)\(weightUnit)"
    }
    
    @IBAction func calculatePress(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculator.setBmiValue(weight: weight, height: height)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    /* if you have multiples views then using segue.indentifier you can decide witch routes belongs to
         */
        if segue.identifier == "goToResult"{
            let destionationVC = segue.destination as! ResultViewController
            destionationVC.bmi = calculator.bmi
        }
    }
}

