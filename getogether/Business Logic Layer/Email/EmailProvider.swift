//
//  EmailProvider.swift
//  getogether
//
//  Created by Imran Hajiyev on 18.04.23.
//

protocol EmailProvider {
    func confirmEmail()
    func confirmEmail(token: String, tokenId: String)
    func resendConfirmationEmail(to email: String)
    func sendPasswordReset(to email: String)
}
