//
//  WellcomeViewController.swift
//  AboutMe
//
//  Created by Екатерина Кузнецова on 05.08.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var myNameLable: UILabel!
    
    var userName: String!
    var personName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
        myNameLable.text = "My name is \(personName ?? "")"
        
        view.addGradient()
    }
}

extension UIView {
    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [
            UIColor.white.cgColor,
            UIColor.systemPink.cgColor
        ]
        layer.insertSublayer(gradient, at: 0)
    }
}
