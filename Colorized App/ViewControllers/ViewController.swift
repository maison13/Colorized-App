//
//  ViewController.swift
//  Colorized App
//
//  Created by Vovo on 26.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var colorMixtureView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllLabel()
        setupResultOfColorView()
     }
        
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
        setupResultOfColorView()
    }
    
    
    private func setupAllLabel() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
     
    private func setupResultOfColorView() {
        colorMixtureView.layer.cornerRadius = 25
        colorMixtureView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(1.0)
        )
       
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

