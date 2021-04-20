

import Foundation
struct Calculator {
    
    var bmi: BMI?
    mutating func setBmiValue(weight: Float, height: Float)  {
        
        let floatValue = weight / pow(height, 2)
        let valueToString = String(format: "%1.f", floatValue)
        
        if floatValue < 18.5 {
            bmi = BMI(value: valueToString, advice: "UnderWeight", color: .orange)
        }
        else if  floatValue <= 24.9 {
            bmi = BMI(value: valueToString, advice: "Normal", color: .green)
        }
        else
        {
            bmi = BMI(value: valueToString, advice: "Overweight", color: .red)
        }
    }
}
