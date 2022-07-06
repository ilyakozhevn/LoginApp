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
    
    private let user = User.getUser()
    
    //    MARK: keyboard hide
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //    MARK: segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? TabBarController else { return }
        
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            if let logoutViewController = viewController as? LogoutViewController {
                logoutViewController.userName = user.info.name
                
            } else if let introViewController = viewController as? IntroViewController {
                introViewController.introText = user.info.name +
                                                " is an " +
                                                user.info.about +
                                                "\n\nReferences: " +
                                                user.info.references.joined(separator: ", ")
                
                introViewController.avatar = user.info.avatar
                
            } else if let releasesNaviC = viewController as? ReleasesNavigationController {
                guard let releasesViewC = releasesNaviC.topViewController as? ReleasesViewController else { return }
                releasesViewC.releases = []
                for release in user.releases {
                    releasesViewC.releases.append(release)
                }
            }
        }
    }
    
    @IBAction func loginTouched() {
        if checkLoginAnsPassword() {
            performSegue(withIdentifier: "loginToTabBar", sender: nil)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }

    //    MARK: forgot buttons actions
    @IBAction func forgotUserTouched() {
        showAlert(
            title: "I can help you",
            message: "Enter '\(user.login)' as User Name",
            handler: {_ in
                self.userNameTF.text = self.user.login
            }
        )
    }
    
    @IBAction func forgotPasswordTouched() {
        showAlert(
            title: "I can help you",
            message: "Enter '\(user.password)' for Password",
            handler: {_ in
                self.passwordTF.text = self.user.password
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
        if userNameTF.text == user.login && passwordTF.text == user.password {
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
