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
    private let user = User.getUser()

// MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.setCorner()
        passwordTF.setCorner()
        loginButton.layer.cornerRadius = 25
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let profileVC = navigationVC.topViewController as? ProfileViewController else { return }
                profileVC.user = user
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
// MARK: - IBActions
    @IBAction func loginButtonPressed() {
        guard usernameTF.text == user.username, passwordTF.text == user.password else {
            showAlert(
                with: "Somthing wrong!",
                and: "You made a mistake when entering your username or password"
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        
    }
    
    @IBAction func forgetButtonsPressed(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(with: "OMG 😱", and: "You Username is - \(user.username)")
        : showAlert(
            with: "Whaaaat? 🫣",
            and: "How could you forget the password??? Pss.. You passwors - \(user.password)"
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

