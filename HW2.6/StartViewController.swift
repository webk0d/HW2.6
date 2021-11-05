//
//  StartViewController.swift
//  HW2.6
//
//  Created by Сергей Чумаков on 05.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setUlColor(for colorUI: UIColor)
}


class StartViewController: UIViewController {

    @IBOutlet var viewColorStartVC: UIView!
    
    var colorUI = UIColor(red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColorView(color: colorUI)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.colorUInext = colorUI
        settingsVC.delegate = self
    }
    
    private func updateColorView(color: UIColor) {
        viewColorStartVC.backgroundColor = color
    }

}

extension StartViewController: SettingsViewControllerDelegate {
    func setUlColor(for colorUInext: UIColor) {
        updateColorView(color: colorUInext)
        self.colorUI = colorUInext
        
    }
    

}
