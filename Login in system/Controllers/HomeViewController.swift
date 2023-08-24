//
//  HomeViewController.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 21.08.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.loading
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .label
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constant.logout,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapLogout))
    }
    
    // MARK: - Selector
    
    @objc func didTapLogout() {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
}
// MARK: - Set constraints / Add subviews

extension HomeViewController {
    
    private func addSubviews() {
        view.backgroundColor = .white
        view.addViewsTAMIC(homeLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            homeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
