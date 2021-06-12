//
//  SecondViewController.swift
//  BMI
//
//  Created by Chu Du on 11/06/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bmiScoreLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var data:(height: String, weight: String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.backgroundColor = #colorLiteral(red: 0.1064029858, green: 0.1301278174, blue: 0.2129952908, alpha: 1)
        subView.backgroundColor = #colorLiteral(red: 0.2035681605, green: 0.2015935779, blue: 0.2664897144, alpha: 1)
        subView.layer.cornerRadius = 10
        
        titleLabel.text = "Your Result"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .left
        
        guard let dataNew = data, let h = Float(dataNew.height), let w = Float(dataNew.weight) else {
            return
        }
    
        calculateBMI(h / 100, w)
        
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        bmiScoreLabel.textAlignment = .center
        bmiScoreLabel.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.numberOfLines = 4

        recalculateButton.setTitle("RE-CALCULATE", for: .normal)
        recalculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        recalculateButton.backgroundColor = #colorLiteral(red: 0.9089558721, green: 0.2380638421, blue: 0.4004850984, alpha: 1)
        recalculateButton.setTitleColor(.white, for: .normal)
        recalculateButton.layer.cornerRadius = 10
    }
    
    @IBAction func recalculateOnPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func calculateBMI(_ chieuCao: Float, _ canNang :Float) -> () {
        let kq = roundf((canNang / (chieuCao * chieuCao)) * 100) / 100
        
        bmiScoreLabel.text = "\(kq)"
        
        if kq < 18.5 {
            statusLabel.text = "UNDERWEIGHT"
            statusLabel.textColor = #colorLiteral(red: 0.353451401, green: 0.7363529801, blue: 0.8918227553, alpha: 1)
            messageLabel.text = "You need to add more nutrients to have a balanced body."
        }
        else if  kq < 25 {
            statusLabel.text = "NORMAL"
            statusLabel.textColor = #colorLiteral(red: 0.4823070168, green: 0.7743150592, blue: 0.6160700321, alpha: 1)
            messageLabel.text = """
                            You have a normal body weight.
                            Good job!
                            """
        }
        else if kq < 30 {
            statusLabel.text = "OVERWEIGHT"
            statusLabel.textColor = #colorLiteral(red: 0.9591539502, green: 0.5048285723, blue: 0.1311388016, alpha: 1)
            messageLabel.text = "You need to exercise more often to lose weight."
        }
        else {
            statusLabel.text = "FAT"
            statusLabel.textColor = #colorLiteral(red: 0.910918653, green: 0.2681707144, blue: 0.2121827006, alpha: 1)
            messageLabel.text = "You should not eat fried foods too much and must do exercise regularly to lose excess fat."
        }
        
    }
    
    
}
