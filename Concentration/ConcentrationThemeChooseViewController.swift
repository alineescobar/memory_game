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
    
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName  = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                cvc.theme = theme
            }
        }
         else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
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
