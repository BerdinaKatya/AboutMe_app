//
//  ViewController.swift
//  AboutMe
//
//  Created by Екатерина Кузнецова on 05.08.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameTF: UITextField!
    
    private let user = User.getUser()
    
    // MARK: - User Enter
    override func viewDidLoad() {
        userNameTF.text = user.userName
        passwordTF.text = user.passsword
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == user.userName, passwordTF.text == user.passsword else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login or password"
            )
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        tabBarController.viewControllers?.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user.userName
                welcomeVC.personName = user.person.name
            } else if let navigationVC = viewController as? UINavigationController {
                if let infoVC = navigationVC.topViewController as? MainInfoViewController {
                    infoVC.personName = user.person.name
                    infoVC.personSurname = user.person.surname
                    infoVC.birthDate = user.person.birthDate
                    infoVC.personCity = user.person.city
                    infoVC.personJob = user.person.job
                    infoVC.bioInfo = user.person.bio
                }
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func forgotPasswordTapped() {
        showAlert(
            withTitle: "Oops!", andMessage: "Your password is \(user.passsword) 🫣")
    }
    
    @IBAction func forgotNameTapped() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is \(user.userName) 😌")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    // MARK: - Setup Alert Views
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
