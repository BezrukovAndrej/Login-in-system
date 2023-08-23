//
//  ForgotPasswordController.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 21.08.2023.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    private let headerView = AuthHeaderView(titleLabel: Constant.logForgotPassword,
                                            subTitleLabel: Constant.subForgotPassword)
    
    private let emailField = CustomTextField(authFieldType: .email)
    private let resetPasswordButton = CustomButton(title: Constant.logRegisterTitle,
                                                   hasBackground: true,
                                                   fontSize: .big)

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
        
        navigationController?.navigationBar.isHidden = false
        resetPasswordButton.addTarget(self, action: #selector(didTapForgotButton), for: .touchUpInside)
    }
    
    // MARK: - Selector

    @objc func didTapForgotButton() {
        guard let email = emailField.text, !email.isEmpty else { return }
        // TODO: Email validation
    }
}

// MARK: - Set constraints / Add subviews

extension ForgotPasswordController {
    
    private func addSubviews() {
        view.backgroundColor = .white
        [headerView, emailField, resetPasswordButton].forEach { view.addViewsTAMIC($0)}
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 230),
            
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 15),
            emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30),
            resetPasswordButton.centerXAnchor.constraint(equalTo: emailField.centerXAnchor),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
            resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
}
