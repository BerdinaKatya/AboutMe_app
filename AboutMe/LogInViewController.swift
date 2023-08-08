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
    
    let userName = "user"
    let password = "1111"
    
    // MARK: - User Enter
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == userName, passwordTF.text == password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login or password"
            )
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userName = userNameTF.text
    }
    
    // MARK: - IB Actions
    @IBAction func forgotPasswordTapped() {
        showAlert(
            withTitle: "Oops!", andMessage: "Your password is \(password) 🫣")
    }
    
    @IBAction func forgotNameTapped() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is \(userName) 😌")
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

