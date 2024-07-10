//
//  ResultViewController.swift
//  appDevBonus
//
//  Created by Tyler Morris on 7/9/24.
//

import UIKit

class ResultViewController: UIViewController {
    var bmi : Double?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        bmiLabel.text = String(format: "%.2f", (bmi ?? 0.0))
        
        if ((bmi ?? 0.0) < 18.5) {categoryLabel.text = "Underweight"}
        else if ((bmi ?? 0.0) < 25) {categoryLabel.text = "Normal"}
        else if ((bmi ?? 0.0) < 30) {categoryLabel.text = "Overweight"}
        else {categoryLabel.text = "Obese"}
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
