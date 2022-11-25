//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Philip Noskov on 24.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var logoutButton: UIButton!

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.layer.cornerRadius = 25
        greetingLabel.text = "Hello, \(user.person.fullName)!"
    }


}
