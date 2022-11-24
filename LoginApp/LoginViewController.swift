//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Philip Noskov on 23.11.2022.
//

import UIKit

class LoginViewController: UIViewController {
// MARK: - IBOutlets
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
// MARK: - Private Properties
    private let username = "Tomas"
    private let password = "12345"

// MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.setCorner()
        passwordTF.setCorner()
        loginButton.layer.cornerRadius = 25
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = usernameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
// MARK: - IBActions
    @IBAction func loginButtonPressed() {
        if usernameTF.text != username || passwordTF.text != password {
            showAlert(
                with: "Somthing wrong!",
                and: "You made a mistake when entering your username or password"
            )
        }
    }
    
    @IBAction func forgetButtonsPressed(_ sender: UIButton) {
            sender.tag == 0 ?
            showAlert(with: "OMG 😱", and: "You Username is - \(username)") :
            showAlert(
                with: "Whaaaat? 🫣",
                and: "How could you forget the password??? Pss.. You passwors - \(password)"
            )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
// MARK: - Private Methods
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Extensions
extension UIView {
  func setCorner() {
      layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}

