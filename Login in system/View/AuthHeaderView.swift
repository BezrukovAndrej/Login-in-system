//
//  AuthHeaderView.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 22.08.2023.
//

import UIKit

class AuthHeaderView: UIView {
    
    // MARK: - UI Companents
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "logo")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    
    // MARK: - LifeCycle
    
    init(titleLabel: String, subTitleLabel: String) {
        self.titleLabel.text = titleLabel
        self.subTitleLabel.text = subTitleLabel
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set constraints / Add subviews

extension AuthHeaderView {
    
    private func addSubviews() {
        [logoImageView, titleLabel, subTitleLabel].forEach {addViewsTAMIC($0)}
    }
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
