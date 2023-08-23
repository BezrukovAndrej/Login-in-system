//
//  LoginViewController.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 21.08.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let headerView = AuthHeaderView(titleLabel: Constant.logTitle,
                                            subTitleLabel: Constant.logSubTitle)
    
    private let emailField = CustomTextField(authFieldType: .email)
    private let passwordField = CustomTextField(authFieldType: .password)
    private let signInButton = CustomButton(title: Constant.singInButton,
                                            hasBackground: true,
                                            fontSize: .big)
    
    private let newUserButton = CustomButton(title: Constant.newUserButton, fontSize: .medium)
    private let forgotButton = CustomButton(title: Constant.forgotPasswordButton, fontSize: .small)
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        setConstraints()
        
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        forgotButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc func didTapSignIn() {
        let nav = UINavigationController(rootViewController: HomeViewController())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    @objc func didTapNewUser() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapForgotPassword() {
        let vc = ForgotPasswordController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Set constraints / Add subviews

extension LoginViewController {
    
    private func addSubviews() {
        view.backgroundColor = .white
        [headerView, emailField, passwordField,
         signInButton, newUserButton, forgotButton].forEach {view.addViewsTAMIC($0)}
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 240),
            
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 12),
            passwordField.centerXAnchor.constraint(equalTo: emailField.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 55),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            signInButton.centerXAnchor.constraint(equalTo: passwordField.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            newUserButton.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor),
            newUserButton.heightAnchor.constraint(equalToConstant: 30),
            newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            forgotButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 5),
            forgotButton.centerXAnchor.constraint(equalTo: newUserButton.centerXAnchor),
            forgotButton.heightAnchor.constraint(equalToConstant: 30),
            forgotButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
}
