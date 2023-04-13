//
//  ViewController.swift
//  Colorized App
//
//  Created by Vovo on 26.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
   
    // MARK: - IBOutlet
    @IBOutlet weak var colorMixtureView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var textFieldButtons: [UITextField]!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
   
    // MARK: - public properties
    var backgroundColor: UIColor!
    unowned var delegate: SettingsViewControllerDelegate!
    
  
    // MARK: - initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllValueOfColors()
        setupResultOfColorView()
        
        for button in textFieldButtons {
            addDoneButton(textField: button)
        }
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
    }
    
    // MARK: - IBAction
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
    
    // MARK: - Override methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)

    }
    
   // MARK: - Private methods
    private func setupAllValueOfColors() {
        redSlider.value = Float(backgroundColor.rgba.red)
        greenSlider.value = Float(backgroundColor.rgba.green)
        blueSlider.value = Float(backgroundColor.rgba.blue)
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
        
        
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
    
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAktion = UIAlertAction(title: "ok", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAktion)
        present(alert, animated: true)
        
    }
    private func addDoneButton(textField: UITextField) {
        let keypadToolbar: UIToolbar = UIToolbar()
        let done = UIBarButtonItem(
            title: "Done",
            style: UIBarButtonItem.Style.done,
            target: textField,
            action: #selector(UITextField.resignFirstResponder)
        )
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
            target: nil,
            action: nil
        )
        keypadToolbar.sizeToFit()
        keypadToolbar.setItems([flexibleSpace, done], animated: false)
        textField.inputAccessoryView = keypadToolbar
    }
        /*private func checkValue(_ sender: UITextField) {
            let textLength = sender.text?.count ?? 0
            if textLength > 4 {
                showAlert(withTitle: "Ошибка ввода", andMessage: "Диапазон значений должен быть от 0 до 1")
            }
            
        }*/
    
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
        setupResultOfColorView()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length + range.location > textField.text?.count ?? 0 {
            return false
        }
        let newLimit = (textField.text?.count)! + string.count - range.length
        return newLimit <= 4
        
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



