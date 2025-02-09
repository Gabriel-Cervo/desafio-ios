//
//  File.swift
//  
//
//  Created by João Gabriel Dourado Cervo on 14/03/24.
//

import Foundation
import Core

public protocol LoginViewModelInput: AnyObject {
    func isValid(cpf: String) -> Bool
    func isValid(password: String) -> Bool
    func didSubmit(login: LoginData)
}

public protocol LoginViewModelOutput: AnyObject {
    var onLoginSuccess: ((TokenRevalidationResponse) -> Void)? { get set }
    var onLoginError: ((Error) -> Void)? { get set }
}

public protocol LoginViewModelProtocol: LoginViewModelInput & LoginViewModelOutput {
    var loginData: LoginData { get set }
}
