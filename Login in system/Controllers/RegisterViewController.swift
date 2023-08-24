//
//  RegisterViewController.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 21.08.2023.
//

import UIKit

final class RegisterViewController: UIViewController {
    
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
        let attributedString = NSMutableAttributedString(string: Constant.registerTextView)
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: Constant.termsAndcondtions))
        attributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attributedString.string as NSString).range(of: Constant.privacyPolicy))
        let textView = UITextView()
        textView.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        textView.attributedText = attributedString
        textView.backgroundColor = .clear
        textView.textColor = .label
        textView.isSelectable = true
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.delaysContentTouches = false
        textView.textAlignment = .center
        return textView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        setConstraints()
        
        termsTextView.delegate = self
        
        singUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc func didTapSignIn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapSignUp() {
        let registerUserRequest = RegisterUserRequest(
            username: userNameField.text ?? "",
            email: emailField.text ?? "",
            password: passwordField.text ?? ""
        )
        
        if !Validation.isValidUserName(for: registerUserRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        if !Validation.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        if !Validation.isPasswordValid(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showRegisterErrorAlert(on: self, with: error)
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegisterErrorAlert(on: self)
            }
        }
    }
}

// MARK: - UITextViewDelegate

extension RegisterViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.scheme == "terms" {
            showWebViewController(with: Url.terms)
        } else if URL.scheme == "privacy" {
            showWebViewController(with: Url.privacy)
        }
        
        func showWebViewController(with urlString: String) {
            let vc = WebViewController(with: urlString)
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        }
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
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
            termsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            termsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 10),
            signInButton.centerXAnchor.constraint(equalTo: termsTextView.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
}
