//
//  Constant.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 22.08.2023.
//

import Foundation

struct Constant {
    
    static let logTitle = NSLocalizedString("singIntext", comment: "")
    static let logSubTitle = NSLocalizedString("subText", comment: "")
    static let placeholderName = NSLocalizedString("textFieldtextname", comment: "")
    static let placeholderEmail = NSLocalizedString("textFieldtextandress", comment: "")
    static let placeholderPassword = NSLocalizedString("textFieldtextpass", comment: "")
    static let singInButton = NSLocalizedString("buttonIn", comment: "")
    static let newUserButton = NSLocalizedString("createAccount", comment: "")
    static let forgotPasswordButton = NSLocalizedString("forgotPassword", comment: "")
    static let logRegisterTitle = NSLocalizedString("singUptext", comment: "")
    static let sendPassword = NSLocalizedString("sendPassword", comment: "")
    static let logSubRegisterTitle = NSLocalizedString("subTextUp", comment: "")
    static let signInButtonRegister = NSLocalizedString("alreadyHaveAcc", comment: "")
    static let registerTextView = NSLocalizedString( "policyAndConditionsText", comment: "")
    static let rightBarButtonWeb = NSLocalizedString("webButton", comment: "")
    static let logForgotPassword = NSLocalizedString("forgottext", comment: "")
    static let subForgotPassword = NSLocalizedString("subTextForgot", comment: "")
    static let loading = NSLocalizedString("accauntVc", comment: "")
    static let logout = NSLocalizedString("outLog", comment: "")
    static let alertTitle = NSLocalizedString("alertButton", comment: "")
    static let alertTitleInvalidEmail = NSLocalizedString("alertErrorEmail", comment: "")
    static let alertMessageInvalidEmail = NSLocalizedString("alertValidEmail", comment: "")
    static let alertTitleInvalidPassword = NSLocalizedString("alertInvalidPass", comment: "")
    static let alertMessageInvalidPassword  = NSLocalizedString("alertValidPass", comment: "")
    static let alertTitleInvalidUsername = NSLocalizedString("alertInvalidUser", comment: "")
    static let alertMessageInvalidUsername  = NSLocalizedString("alertEnterValidUser", comment: "")
    static let alertRegistrationError = NSLocalizedString("alertUnknownRegError", comment: "")
    static let alertSingInError = NSLocalizedString("alertErrorSingIn", comment: "")
    static let alertLogoutError = NSLocalizedString("alertLogOut", comment: "")
    static let alertErrorSendingPassword = NSLocalizedString("alertErrorSendPass", comment: "")
    static let alertPasswordResetSent = NSLocalizedString("alertPassResSent", comment: "")
    static let alertFetchingUserError = NSLocalizedString("alertErrorFetch", comment: "")
    static let alertUnknownFetchingUserError = NSLocalizedString("alertUnknownErrorUser", comment: "")
    static let termsAndcondtions = NSLocalizedString("termsAndcondtions", comment: "")
    static let privacyPolicy = NSLocalizedString("privacyPolicy", comment: "")
}

struct Url {
    
    static let terms = "https://policies.google.com/terms?hl=ru"
    static let privacy = "https://policies.google.com/privacy?hl=ru"
}
