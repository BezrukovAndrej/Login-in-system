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
        dismiss(animated: true)
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
