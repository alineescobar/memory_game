//
//  ConcentrationThemeChooseViewController.swift
//  Concentration
//
//  Created by Aline Escobar on 01/12/20.
//  Copyright © 2020 Aline Escobar. All rights reserved.
//

import UIKit

class ConcentrationThemeChooseViewController: UIViewController {
    
    let themes = [
        "Animals":"🐈🐓🐕🐋🐞🦋🦚🦥",
        "Electronics":"💻📱🎮📷📡🎧💾📼",
        "Flags":"🇧🇷🇩🇪🇫🇷🇳🇬🇮🇹🇦🇴🇵🇭🇲🇾"
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
}
