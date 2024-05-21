//
//  Register.swift
//  YUMEATSS
//
//  Created by islombek on 29/04/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone Number"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupActions()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(phoneNumberTextField)
        view.addSubview(nameTextField)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            phoneNumberTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40),
            
            nameTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 120),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupActions() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc private func registerButtonTapped() {
        guard let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty else {
            showAlert(withTitle: "Error", message: "Please enter your phone number.")
            return
        }
        
        showAlert(withTitle: "Registration Successful", message: "SMS code sent to \(phoneNumber)")
    }
    
    private func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
