//
//  ColorViewController.swift
//  Colorized App
//
//  Created by Vovo on 12.04.2023.
//

import UIKit
// MARK: - protocols
protocol SettingsViewControllerDelegate: AnyObject {
    func setBackgroundColor(for backgroundColor: UIColor )
}
// MARK: - Life Cycle View
final class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.backgroundColor = view.backgroundColor
        settingsVC.delegate = self
    }

}

// MARK: - SettingsViewControllerDelegate
extension ColorViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(for backgroundColor: UIColor) {
        view.backgroundColor = backgroundColor
    }
}
