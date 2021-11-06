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
    
    // MARK: - IB Outlet
    @IBOutlet var viewColorStartVC: UIView!
    
    
    // MARK: - Public Propirties
    var colorUI = UIColor(red: CGFloat(1.0), green: CGFloat(1.0), blue: CGFloat(1.0), alpha: 1)
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColorView(color: colorUI)

    }
    
    // MARK: - Navigate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colorUInext = colorUI
        settingsVC.delegate = self
    }
    
    // MARK: - Private Methods
    private func updateColorView(color: UIColor) {
        viewColorStartVC.backgroundColor = color
    }

}

// MARK: - SettingsViewControllerDelegate
extension StartViewController: SettingsViewControllerDelegate {
    func setUlColor(for colorUInext: UIColor) {
        self.colorUI = colorUInext
        updateColorView(color: colorUInext)
                
    }
    

}
