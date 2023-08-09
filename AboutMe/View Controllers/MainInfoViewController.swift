//
//  MainInfoViewController.swift
//  AboutMe
//
//  Created by Екатерина Теляубердина on 09.08.2023.
//

import UIKit

final class MainInfoViewController: UIViewController {

    @IBOutlet var photoImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var birthDateLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    
    var personName: String!
    var personSurname: String!
    var birthDate: String!
    var personCity: String!
    var personJob: String!
    var bioInfo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImage.layer.cornerRadius = 90
        
        view.addGradient()
        
        navigationItem.title = "\(personName ?? "") \(personSurname ?? "")"
        
        nameLabel.text = personName
        surnameLabel.text = personSurname
        birthDateLabel.text = birthDate
        cityLabel.text = personCity
        jobLabel.text = personJob
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else { return }
        bioVC.bioInfo = bioInfo
    }
 
}
