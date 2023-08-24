//
//  CustomButton.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 22.08.2023.
//

import UIKit

enum FontSize {
    case big
    case medium
    case small
}

final class CustomButton: UIButton {
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? .systemBlue : .clear
        let titleColor: UIColor = hasBackground ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .medium:
            titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        case .small:
            titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
