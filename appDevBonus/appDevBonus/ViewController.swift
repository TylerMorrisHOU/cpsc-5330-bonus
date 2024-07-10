//
//  ViewController.swift
//  appDevBonus
//
//  Created by Tyler Morris on 7/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var unitSwitch: UISwitch!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightInput: UITextField!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightInput: UITextField!
    
    let NUM_REGEX = /^(-?)(\d+)((\.\d+)?)$/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        unitSwitch.isOn = true
        weightLabel.text = "Weight (lbs)"
        heightLabel.text = "Height (in)"
    }
    
    func textValidate() -> Bool {
        if ((heightInput.text ?? "").contains(NUM_REGEX)
            && (weightInput.text ?? "").contains(NUM_REGEX)) {
            return true
        }
        return false
    }

    @IBAction func switchFlipped(_ sender: Any) {
        if (unitSwitch.isOn) {
            weightLabel.text = "Weight (lbs)"
            heightLabel.text = "Height (in)"
        } else {
            weightLabel.text = "Weight (kg)"
            heightLabel.text = "Height (cm)"
        }
    }
    
    @IBAction func checkHeight(_ sender: Any) {
        errorLabel.isHidden = textValidate()
    }
    
    @IBAction func checkWeight(_ sender: Any) {
        errorLabel.isHidden = textValidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        heightInput.text = ""
        weightInput.text = ""
        errorLabel.isHidden = textValidate()
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        if (textValidate()) {
            
            self.performSegue(withIdentifier: "calculateBmi", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let result = segue.destination as! ResultViewController
        
        let weight : Double = Double(weightInput.text ?? "0.0")!
        let height : Double = Double(heightInput.text ?? "0.0")!
        let bmi : Double
        if (unitSwitch.isOn) {
            // calculate BMI with imperial units
            bmi = (weight / pow(height, 2)) * 703
        } else {
            // calculate BMI with metric units
            bmi = (weight / pow(height, 2)) * 10000
        }
        
        result.bmi = bmi
    }
    
}

