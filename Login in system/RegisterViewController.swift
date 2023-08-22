//
//  RegisterViewController.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 21.08.2023.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    // MARK: - UI Companents
    private let headerView = AuthHeaderView(titleLabel: Constant.logRegisterTitle,
                                            subTitleLabel: Constant.logSubRegisterTitle)
    
    private let userNameField = CustomTextField(authFieldType: .userName)
    private let emailField = CustomTextField(authFieldType: .email)
    private let passwordField = CustomTextField(authFieldType: .password)
    private let singUpButton = CustomButton(title: Constant.logRegisterTitle,
                                            hasBackground: true,
                                            fontSize: .big)
    
    private let signInButton = CustomButton(title: Constant.signInButtonRegister, fontSize: .medium)
    
    private let termsTextView: UITextView = {
        let textView = UITextView()
        textView.text = Constant.registerTextView
        textView.backgroundColor = .clear
        textView.textColor = .label
        textView.isSelectable = true
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        return textView
    }()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        setConstraints()
        
        singUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc func didTapSignIn() {
        navigationController?.popViewController(animated: true)
        ///// dasda da
    }
    
    @objc func didTapSignUp() {
    }
}
// MARK: - Set constraints / Add subviews

extension RegisterViewController {
    
    private func addSubviews() {
        view.backgroundColor = .white
        [headerView, userNameField, emailField,
         passwordField, signInButton, singUpButton,
         termsTextView].forEach {view.addViewsTAMIC($0)}
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 240),
            
            userNameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            userNameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            userNameField.heightAnchor.constraint(equalToConstant: 55),
            userNameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            emailField.topAnchor.constraint(equalTo: userNameField.bottomAnchor, constant: 12),
            emailField.centerXAnchor.constraint(equalTo: userNameField.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 12),
            passwordField.centerXAnchor.constraint(equalTo: emailField.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 55),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            singUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            singUpButton.centerXAnchor.constraint(equalTo: passwordField.centerXAnchor),
            singUpButton.heightAnchor.constraint(equalToConstant: 55),
            singUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            termsTextView.topAnchor.constraint(equalTo: singUpButton.bottomAnchor, constant: 5),
            termsTextView.centerXAnchor.constraint(equalTo: singUpButton.centerXAnchor),
            termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 10),
            signInButton.centerXAnchor.constraint(equalTo: termsTextView.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
}
