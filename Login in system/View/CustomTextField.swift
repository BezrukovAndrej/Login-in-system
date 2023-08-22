//
//  CustomTextField.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 22.08.2023.
//

import UIKit

enum CustomTextFieldType {
    case userName
    case email
    case password
}

final class CustomTextField: UITextField {
    
    private let authFieldType: CustomTextFieldType
    
    init(authFieldType: CustomTextFieldType) {
        self.authFieldType = authFieldType
        super.init(frame: .zero)
        
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        
        returnKeyType = .done
        autocorrectionType = .no
        autocapitalizationType = .none
        
        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0,
                                        width: 12,
                                        height: frame.size.height))
        
        switch authFieldType {
        case .userName:
            placeholder = Constant.placeholderName
        case .email:
            placeholder = Constant.placeholderEmail
            keyboardType = .emailAddress
            textContentType = .emailAddress
        case .password:
            placeholder = Constant.placeholderPassword
            textContentType = .oneTimeCode
            isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
