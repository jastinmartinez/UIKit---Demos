import UIKit


squareDigits(9119)

func squareDigits(_ num: Int) -> Int {
    var r = 0.0
    for (_,x) in String(num).enumerated() {
        r =  sqrt(Double(x.wholeNumberValue!))
    }
    
  return Int(r)
}
