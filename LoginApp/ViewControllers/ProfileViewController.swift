//
//  ProfileViewController.swift
//  LoginApp
//
//  Created by Philip Noskov on 25.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var careerLabel: UILabel!
    @IBOutlet var educationLabel: UILabel!
    
    @IBOutlet var showButton: UIButton!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = user.person.fullName
        careerLabel.text = user.person.career
        educationLabel.text = user.person.education
        showButton.layer.cornerRadius = 25
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.user = user
    }
    

}
