//
//  BioViewController.swift
//  AboutMe
//
//  Created by Екатерина Теляубердина on 09.08.2023.
//

import UIKit

final class BioViewController: UIViewController {

    @IBOutlet var bioLabel: UILabel!
    
    var bioInfo: String!
    var personName: String!
    var personSurname: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGradient()
        
        navigationItem.title = "\(personName ?? "") \(personSurname ?? "")"
        bioLabel.text = bioInfo
    }
}
