//
//  SignUpViewController.swift
//  ToDoApp
//
//  Created by Ali Raza on 01/07/2024.
//

import UIKit

class SignUpViewController: BaseViewController {
    
    
    private lazy var emailField : TextField = {
        let field = TextField(placeholder: "Enter your email",cornerRadius: 20, backgroundColor: .clear,borderColor: .black)
        field.tag = 1
        field.delegate = self
        field.addTarget(self, action: #selector(textfieldDidChangeEditing(_:)), for: .editingChanged)
        return field
    }()
    
    private lazy var passwordField : TextField = {
        let field = TextField(placeholder: "Enter your Password",cornerRadius: 20, backgroundColor: .clear,borderColor: .black, isEyeButtonRequired: true)
        field.tag = 2
        field.isSecureTextEntry = true
        field.delegate = self
        field.addTarget(self, action: #selector(textfieldDidChangeEditing(_:)), for: .editingChanged)
        return field
    }()
    
    private lazy var confirmPasswordField : TextField = {
        let field = TextField(placeholder: "Confirm  Password",cornerRadius: 20, backgroundColor: .clear,borderColor: .black, isEyeButtonRequired: true)
        field.tag = 2
        field.isSecureTextEntry = true
        field.delegate = self
        field.addTarget(self, action: #selector(textfieldDidChangeEditing(_:)), for: .editingChanged)
        return field
    }()
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        topLabel.text = "Sign Up"
        continueButton.disable()
        bindViews()
    }
    
    //MARK: - Functions
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(confirmPasswordField)
        
        NSLayoutConstraint.activate([
            
            emailField.topAnchor.constraint(equalTo: topLabel.bottomAnchor,constant: 40),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 25),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 25),
            confirmPasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            confirmPasswordField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            confirmPasswordField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    private func bindViews() {
        self.continueButton.didTappedContinue = {
            let controller = ListOfTodoController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @objc func textfieldDidChangeEditing(_ textField: UITextField) {
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return }
        guard let confirmPassword = confirmPasswordField.text else {return }
        
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
        let isEmailValid = email.range(of: emailRegex, options: .regularExpression) != nil
        
        if isEmailValid && password.count >= 6 && confirmPassword.count >= 6 && password == confirmPassword {
            self.continueButton.enable()
        } else {
            self.continueButton.disable()
        }
    }
} 

extension SignUpViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "_@."))
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        } else if textField.tag == 2{
            let disallowedCharacterSet = CharacterSet.whitespaces
            let characterSet = CharacterSet(charactersIn: string)
            return disallowedCharacterSet.isDisjoint(with: characterSet)
        }
        return false
    }
}
