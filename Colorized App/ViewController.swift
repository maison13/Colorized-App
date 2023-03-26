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
        
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redLabel.text = redSlider.value.formatted(.number.precision(.fractionLength(2)))
        case greenSlider:
            greenLabel.text = greenSlider.value.formatted(.number.precision(.fractionLength(2)))
        default:
            blueLabel.text = blueSlider.value.formatted(.number.precision(.fractionLength(2)))
        }
        setupResultOfColorView()
    }
    
    private func setupAllLabel() {
        redLabel.text = redSlider.value.formatted(.number.precision(.fractionLength(2)))
        greenLabel.text = greenSlider.value.formatted(.number.precision(.fractionLength(2)))
        blueLabel.text = blueSlider.value.formatted(.number.precision(.fractionLength(2)))
    }
     
    private func setupResultOfColorView() {
        colorMixtureView.layer.cornerRadius = 25
        colorMixtureView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value), alpha: CGFloat(1.0))
       
    }
    
}

