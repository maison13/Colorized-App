//
//  ViewController.swift
//  Colorized App
//
//  Created by Vovo on 26.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var resultOfColorView: UIView!
    
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
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func redSliderAction() {
        redLabel.text = redSlider.value.formatted(.number.precision(.fractionLength(2)))
        resultOfColorView.backgroundColor = .red.withAlphaComponent(CGFloat(redSlider.value))
    }
       
    @IBAction func greenSliderAction() {
        greenLabel.text = greenSlider.value.formatted(.number.precision(.fractionLength(2)))
        resultOfColorView.backgroundColor = .green.withAlphaComponent(CGFloat(greenSlider.value))
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = blueSlider.value.formatted(.number.precision(.fractionLength(2)))
        resultOfColorView.backgroundColor = .blue.withAlphaComponent(CGFloat(blueSlider.value))
    }
    
    
    
    
    
    
    
    private func setupAllLabel() {
        redLabel.text = redSlider.value.formatted(.number.precision(.fractionLength(2)))
        greenLabel.text = greenSlider.value.formatted(.number.precision(.fractionLength(2)))
        blueLabel.text = blueSlider.value.formatted(.number.precision(.fractionLength(2)))
    }
     
    private func setupResultOfColorView() {
        resultOfColorView.backgroundColor = .red.withAlphaComponent(CGFloat(redSlider.value)) 
        resultOfColorView.backgroundColor = .green.withAlphaComponent(CGFloat(greenSlider.value))
        resultOfColorView.backgroundColor = .blue.withAlphaComponent(CGFloat(blueSlider.value))
    }
    
    
    
}

