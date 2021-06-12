//
//  FirstViewController.swift
//  BMI
//
//  Created by Chu Du on 11/06/2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var maleView: UIView!
    @IBOutlet weak var femaleView: UIView!
    @IBOutlet weak var maleImage: UIImageView!
    @IBOutlet weak var femaleImage: UIImageView!
    @IBOutlet weak var maleLabel: UILabel!
    @IBOutlet weak var femaleLabel: UILabel!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var numberOfHeightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var numberOfWeightLabel: UILabel!
    @IBOutlet weak var decreaseWeightButton: UIButton!
    @IBOutlet weak var increaseWeightButton: UIButton!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var numberOfAgeLabel: UILabel!
    @IBOutlet weak var decreaseAgeButton: UIButton!
    @IBOutlet weak var increaseAgeButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    
    let step:Float = 1
    var roundedValue:Float!
    let minWeight:Int = 20
    let maxWeight:Int = 200
    let minAge:Int = 20
    let maxAge:Int = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        
        headerView.backgroundColor = #colorLiteral(red: 0.1064029858, green: 0.1301278174, blue: 0.2129952908, alpha: 1)
        headerLabel.text = "BMI CALCULATOR"
        headerLabel.font = UIFont.systemFont(ofSize: 30)
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        
        subView.backgroundColor = #colorLiteral(red: 0.1064029858, green: 0.1301278174, blue: 0.2129952908, alpha: 1)
        
        maleView.backgroundColor = #colorLiteral(red: 0.2035681605, green: 0.2015935779, blue: 0.2664897144, alpha: 1)
        femaleView.backgroundColor = #colorLiteral(red: 0.2035681605, green: 0.2015935779, blue: 0.2664897144, alpha: 1)
        maleView.layer.cornerRadius = 10
        femaleView.layer.cornerRadius = 10
        maleImage.image = UIImage(named: "male")
        femaleImage.image = UIImage(named: "female")
        maleLabel.text = "MALE"
        femaleLabel.text = "FEMALE"
        maleLabel.textAlignment = .center
        femaleLabel.textAlignment = .center
        maleLabel.textColor = .lightGray
        femaleLabel.textColor = .lightGray
        
        heightView.backgroundColor = #colorLiteral(red: 0.2035681605, green: 0.2015935779, blue: 0.2664897144, alpha: 1)
        heightView.layer.cornerRadius = 10
        heightLabel.text = "HEIGHT"
        heightLabel.textAlignment = .center
        heightLabel.textColor = .lightGray
        heightSlider.tintColor = #colorLiteral(red: 0.5988526344, green: 0.3473231196, blue: 0.4418354034, alpha: 1)
        heightSlider.minimumValue = 50
        heightSlider.maximumValue = 250
        heightSlider.value = 150
        numberOfHeightLabel.text = "150"
        numberOfHeightLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        numberOfHeightLabel.textColor = .white
        numberOfHeightLabel.textAlignment = .right
        
        weightView.backgroundColor = #colorLiteral(red: 0.2035681605, green: 0.2015935779, blue: 0.2664897144, alpha: 1)
        weightView.layer.cornerRadius = 10
        weightLabel.text = "WEIGHT"
        weightLabel.textAlignment = .center
        weightLabel.textColor = .lightGray
        numberOfWeightLabel.text = "50"
        numberOfWeightLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        numberOfWeightLabel.textColor = .white
        numberOfWeightLabel.textAlignment = .center
        decreaseWeightButton.setImage(UIImage(named: "minus"), for: .normal)
        decreaseWeightButton.setTitle("", for: .normal)
        decreaseWeightButton.tintColor = .white
        decreaseWeightButton.backgroundColor = #colorLiteral(red: 0.3696677089, green: 0.3757223487, blue: 0.4301977456, alpha: 1)
        decreaseWeightButton.layer.cornerRadius = increaseWeightButton.bounds.height/2
        increaseWeightButton.setImage(UIImage(named: "plus"), for: .normal)
        increaseWeightButton.setTitle("", for: .normal)
        increaseWeightButton.tintColor = .white
        increaseWeightButton.backgroundColor = #colorLiteral(red: 0.3696677089, green: 0.3757223487, blue: 0.4301977456, alpha: 1)
        increaseWeightButton.layer.cornerRadius = increaseWeightButton.bounds.height/2
        
        ageView.backgroundColor = #colorLiteral(red: 0.2035681605, green: 0.2015935779, blue: 0.2664897144, alpha: 1)
        ageView.layer.cornerRadius = 10
        ageLabel.text = "AGE"
        ageLabel.textAlignment = .center
        ageLabel.textColor = .lightGray
        numberOfAgeLabel.text = "\(minAge)"
        numberOfAgeLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        numberOfAgeLabel.textColor = .white
        numberOfAgeLabel.textAlignment = .center
        increaseAgeButton.setImage(UIImage(named: "plus"), for: .normal)
        increaseAgeButton.setTitle("", for: .normal)
        increaseAgeButton.tintColor = .white
        increaseAgeButton.backgroundColor = #colorLiteral(red: 0.3696677089, green: 0.3757223487, blue: 0.4301977456, alpha: 1)
        increaseAgeButton.layer.cornerRadius = increaseAgeButton.bounds.height/2
        decreaseAgeButton.setImage(UIImage(named: "minus"), for: .normal)
        decreaseAgeButton.setTitle("", for: .normal)
        decreaseAgeButton.tintColor = .white
        decreaseAgeButton.backgroundColor = #colorLiteral(red: 0.3696677089, green: 0.3757223487, blue: 0.4301977456, alpha: 1)
        decreaseAgeButton.layer.cornerRadius = decreaseAgeButton.bounds.height/2
        
        calculateButton.setTitle("CALCULATE", for: .normal)
        calculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        calculateButton.backgroundColor = #colorLiteral(red: 0.9089558721, green: 0.2380638421, blue: 0.4004850984, alpha: 1)
        calculateButton.layer.cornerRadius = 10
        calculateButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func calculateOnPress(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let seconVC = storyboard.instantiateViewController(identifier: "SecondViewController") as SecondViewController
        
        guard let height = numberOfHeightLabel.text, let weight = numberOfWeightLabel.text else {
            return
        }
        
        seconVC.modalPresentationStyle = .fullScreen
        
        seconVC.data = (height, weight)
        
        self.present(seconVC, animated: true, completion: nil)
    }
    
    @IBAction func onPressMaleView(_ sender: UITapGestureRecognizer) {
        maleView.backgroundColor = #colorLiteral(red: 0.1414909959, green: 0.1496081352, blue: 0.2265147269, alpha: 1)
        femaleView.backgroundColor = #colorLiteral(red: 0.2035681605, green: 0.2015935779, blue: 0.2664897144, alpha: 1)
    }
    
    @IBAction func onPressFemaleView(_ sender: UITapGestureRecognizer) {
        femaleView.backgroundColor = #colorLiteral(red: 0.1414909959, green: 0.1496081352, blue: 0.2265147269, alpha: 1)
            maleView.backgroundColor = #colorLiteral(red: 0.2035681605, green: 0.2015935779, blue: 0.2664897144, alpha: 1)
    }
    
    @IBAction func onChangeHeight(_ sender: UISlider) {
        roundedValue = roundf(sender.value / step) * step
        sender.value = roundedValue
        numberOfHeightLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func onPressDecreaseWeight(_ sender: UIButton) {
        guard let weightStr = numberOfWeightLabel.text, let weight = Int(weightStr) else {
            return
        }
        var w = weight
        if w <= minWeight {
            w = minWeight
            return
        }
        w -= 1
        numberOfWeightLabel.text = "\(w)"
    }
    
    @IBAction func onPressIncreaseWeight(_ sender: UIButton) {
        guard let weightStr = numberOfWeightLabel.text, let weight = Int(weightStr) else {
            return
        }
        var w = weight
        if w >= maxWeight {
            w = maxWeight
            return
        }
        w += 1
        numberOfWeightLabel.text = "\(w)"
    }
    
    @IBAction func onPressDecreaseAge(_ sender: UIButton) {
        guard let ageStr = numberOfAgeLabel.text, let age = Int(ageStr) else {
            return
        }
        var a = age
        if a <= minAge {
            a = minAge
            return
        }
        a -= 1
        numberOfAgeLabel.text = "\(a)"
    }
    
    @IBAction func onPressIncreaseAge(_ sender: UIButton) {
        guard let ageStr = numberOfAgeLabel.text, let age = Int(ageStr) else {
            return
        }
        var a = age
        if a >= maxAge {
            a = maxAge
            return
        }
        a += 1
        numberOfAgeLabel.text = "\(a)"
    }
}
