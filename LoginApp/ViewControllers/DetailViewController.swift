//
//  DetailViewController.swift
//  LoginApp
//
//  Created by Philip Noskov on 25.11.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var objectivLabel: UILabel!
    @IBOutlet var educationLabel: UILabel!
    @IBOutlet var skillsLabel: UILabel!
    
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        fullNameLabel.text = user.person.fullName
        ageLabel.text = user.person.age.formatted()
        emailLabel.text = user.person.email
        objectivLabel.text = user.person.career
        educationLabel.text = user.person.education
        skillsLabel.text = user.person.skills
    }

}
