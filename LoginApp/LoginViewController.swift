//
//  ViewController.swift
//  LoginApp
//
//  Created by Ilya Kozhevnikov on 03.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var PasswordTF: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeWC = segue.destination as? WelcomeViewController else { return }
        welcomeWC.userName = userNameTF.text ?? ""
    }
    
    //    MARK: segue - check login & password
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let userName = userNameTF.text, PasswordTF.text == passwords[userName] else {
            
            let wrongAlert = UIAlertController(
                title: "Invalid Login or Password",
                message: "Please enter correct login and password",
                preferredStyle: .alert
            )
            
            let alertButton = UIAlertAction(
                title: "OK",
                style: .default,
                handler: { _ in
                    self.PasswordTF.text = ""
                }
            )
            wrongAlert.addAction(alertButton)
            
            present(wrongAlert, animated: true)
            
            return false
        }
        return true
    }
    
    //    MARK: keyboard hide
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //    MARK: forgot buttons actions
    
    @IBAction func forgotUserTouched() {
        let wrongAlert = UIAlertController(
            title: "I can help you",
            message: "Enter 'username' as User Name",
            preferredStyle: .alert
        )
        
        let alertButton = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.userNameTF.text = "username"
        })
        
        wrongAlert.addAction(alertButton)
        
        present(wrongAlert, animated: true)
    }
    
    @IBAction func forgotPasswordTouched() {
        let wrongAlert = UIAlertController(
            title: "I can help you",
            message: "Enter 'Password' for Password",
            preferredStyle: .alert
        )
        
        let alertButton = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.PasswordTF.text = "Password"
        })
        
        wrongAlert.addAction(alertButton)
        
        present(wrongAlert, animated: true)
    }
    
}

let passwords = [
    "username": "Password"
]
