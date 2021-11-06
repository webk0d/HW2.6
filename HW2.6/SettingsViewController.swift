//
//  SettingsViewController.swift
//  HW2.2
//
//  Created by Сергей Чумаков on 23.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlet
    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    @IBOutlet weak var labelBlue: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    // MARK: - Public Propirties
    var colorUInext: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 10
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        
        defaultColorSliderText(color: colorUInext)
    }
    
    // MARK: - IB Action
    @IBAction func doneButton() {
        delegate.setUlColor(for: colorUInext)
        dismiss(animated: true)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
        case sliderRed:
            labelRed.text = string(from: sliderRed)
        case sliderGreen:
            labelGreen.text = string(from: sliderGreen)
        default:
            labelBlue.text = string(from: sliderBlue)
        }
    }
    
    // MARK: - Private Methods
    private func defaultColorSliderText(color: UIColor) {
        viewColor.backgroundColor = color
        sliderRed.value = Float(colorUInext.colorComponents!.red)
        sliderGreen.value = Float(colorUInext.colorComponents!.green)
        sliderBlue.value = Float(colorUInext.colorComponents!.blue)
        setValue(for: labelRed, labelGreen, labelBlue)
        
    }
    
    private func setColor() {
            colorUInext = UIColor(
                red: CGFloat(sliderRed.value),
                green: CGFloat(sliderGreen.value),
                blue: CGFloat(sliderBlue.value),
                alpha: 1
            )
            viewColor.backgroundColor = colorUInext
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case labelRed:
                labelRed.text = string(from: sliderRed)
            case labelGreen:
                labelGreen.text = string(from: sliderGreen)
            default:
                labelBlue.text = string(from: sliderBlue)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

}

// MARK: - UIColor
extension UIColor {
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        guard let components = self.cgColor.components else { return nil }

        return (
            red: components[0],
            green: components[1],
            blue: components[2],
            alpha: components[3]
        )
    }
}
