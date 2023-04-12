//
//  ViewController.swift
//  Colorized App
//
//  Created by Vovo on 26.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {

    @IBOutlet weak var colorMixtureView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    var backgroundColor: UIColor!
    unowned var delegate: SettingsViewControllerDelegate!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllValueOfColors()
        setupResultOfColorView()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        
        
        
     }
        
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        delegate.setBackgroundColor(for: colorMixtureView.backgroundColor ?? backgroundColor)
        dismiss(animated: true)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
        setupResultOfColorView()
    }
    
    
    private func setupAllValueOfColors() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        
        redTextField.text = String(format: "%.2f", backgroundColor.rgba.red)
        greenTextField.text = String(format: "%.2f", backgroundColor.rgba.green)
        blueTextField.text = String(format: "%.2f", backgroundColor.rgba.blue)
        
        redSlider.value = Float(backgroundColor.rgba.red)
        greenSlider.value = Float(backgroundColor.rgba.green)
        blueSlider.value = Float(backgroundColor.rgba.blue)

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
// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        
        switch textField {
        case redTextField:
            redLabel.text = String(numberValue)
            redSlider.value = numberValue
        case greenTextField:
            greenLabel.text = String(numberValue)
            greenSlider.value = numberValue
        default:
            blueLabel.text = String(numberValue)
            blueSlider.value = numberValue
        }
    }
}
// MARK: - return RGBA from UIColor
extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}

