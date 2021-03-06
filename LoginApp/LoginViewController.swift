//
//  ViewController.swift
//  LoginApp
//
//  Created by Ilya Kozhevnikov on 03.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let passwords = [
        "ilyakozhevn": "lalala"
    ]
    
    //    MARK: keyboard hide
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event) //что если этой строки не будет?
        view.endEditing(true)
    }
    
    //    MARK: segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return checkLoginAnsPassword()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeWC = segue.destination as? WelcomeViewController else { return }
        welcomeWC.userName = userNameTF.text ?? ""
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }

    //    MARK: forgot buttons actions
    @IBAction func forgotUserTouched() {
        showAlert(
            title: "I can help you",
            message: "Enter '\(passwords.keys.first ?? "")' as User Name",
            handler: {_ in
                self.userNameTF.text = self.passwords.keys.first
            }
        )
    }
    
    @IBAction func forgotPasswordTouched() {
        showAlert(
            title: "I can help you",
            message: "Enter '\(passwords[passwords.keys.first!] ?? "")' for Password",
            handler: {_ in
                self.passwordTF.text = self.passwords[self.passwords.keys.first!]
            }
        )
    }
    
    //    MARK: show alert method
    private func showAlert(title: String, message: String, handler: @escaping (UIAlertAction) -> Void) {
        let wrongAlert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let alertButton = UIAlertAction(title: "OK", style: .default, handler: handler)
        
        wrongAlert.addAction(alertButton)
        
        present(wrongAlert, animated: true)
    }
    
    //    MARK: check login
    private func checkLoginAnsPassword() -> Bool {
        if let userName = userNameTF.text, passwordTF.text == passwords[userName] {
            return true
        } else {
            showAlert(
                title: "Invalid Login or Password",
                message: "Please enter correct login and password",
                handler: {_ in
                    self.passwordTF.text?.removeAll()
                }
            )
            return false
        }
    }
}
