//
//  ColorViewController.swift
//  Colorized App
//
//  Created by Vovo on 12.04.2023.
//

import UIKit

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.backgroundColor = view.backgroundColor
    }

}
