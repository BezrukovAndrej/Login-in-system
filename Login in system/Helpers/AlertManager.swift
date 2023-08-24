//
//  AlertManager.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 23.08.2023.
//

import UIKit

final class AlertManager {
        
        private static func showBasicAlert(on vc: UIViewController,
                                            title: String,
                                            message: String?) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title ,message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: Constant.alertTitle, style: .default))
                vc.present(alert, animated: true)
            }
        }
    }

// MARK: - Invalid Alerts

extension AlertManager {
    
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, title: Constant.alertTitleInvalidEmail,
                        message: Constant.alertMessageInvalidEmail)
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, title: Constant.alertTitleInvalidPassword,
                        message: Constant.alertMessageInvalidPassword)
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, title: Constant.alertTitleInvalidUsername,
                        message: Constant.alertMessageInvalidUsername)
    }
}

// MARK: - Register Error Alerts

extension AlertManager {
    
    public static func showRegisterErrorAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, title: Constant.alertRegistrationError, message: nil)
    }
    
    public static func showRegisterErrorAlert(on vc: UIViewController, with error: Error) {
        showBasicAlert(on: vc, title: Constant.alertRegistrationError,
                        message: "\(error.localizedDescription)")
    }
}

// MARK: - Sing In Error Alerts

extension AlertManager {
    
    public static func showSingInErrorAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, title: Constant.alertSingInError, message: nil)
    }
    
    public static func showSingInErrorAlert(on vc: UIViewController, with error: Error) {
        showBasicAlert(on: vc, title: Constant.alertSingInError,
                       message: "\(error.localizedDescription)")
    }
}

// MARK: - Logout Error Alert

extension AlertManager {
    
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        showBasicAlert(on: vc, title: Constant.alertLogoutError,
                       message: "\(error.localizedDescription)")
    }
}

// MARK: - Fargot Password Alert

extension AlertManager {
    
    public static func showPasswordResetSent(on vc: UIViewController) {
        showBasicAlert(on: vc, title: Constant.alertPasswordResetSent, message: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        showBasicAlert(on: vc, title: Constant.alertErrorSendingPassword,
                       message: "\(error.localizedDescription)")
    }
}

// MARK: - User Errror Alert

extension AlertManager {
    
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        showBasicAlert(on: vc, title: Constant.alertFetchingUserError,
                       message: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFetchingUserrError(on vc: UIViewController) {
        showBasicAlert(on: vc, title: Constant.alertUnknownFetchingUserError, message: nil)
    }
}
