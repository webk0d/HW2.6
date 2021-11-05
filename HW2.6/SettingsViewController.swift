//
//  SettingsViewController.swift
//  HW2.2
//
//  Created by Сергей Чумаков on 23.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    @IBOutlet weak var labelBlue: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    
    var colorUInext: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 10

        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
//        defaultColor(color: colorUInext)
        setValue(for: labelRed, labelGreen, labelBlue)
    }
    
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
    
    private func defaultColor(color: UIColor) {
        viewColor.backgroundColor = color
        
    }
    
    private func setColor() {
            viewColor.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
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
