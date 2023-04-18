//
//  RealmEmailService.swift
//  getogether
//
//  Created by Imran Hajiyev on 18.04.23.
//

class RealmEmailService: EmailProvider {
    private let app = RealmAPIClient().getApp()
    private let client = RealmAPIClient().getApp().emailPasswordAuth
    
    func confirmEmail(token: String, tokenId: String) {
        client.confirmUser(token, tokenId: tokenId) { (error) in
            guard error == nil else {
                print("User confirmation failed: \(error!.localizedDescription)")
                return
            }
            
            print("Successfully confirmed user.")
        }
    }
    
    func resendConfirmationEmail(to email: String) {
        client.resendConfirmationEmail(email) { (error) in
            guard error == nil else {
                print("Failed to resend confirmation email: \(error!.localizedDescription)")
                return
            }
            
            print("Confirmation email resent")
        }
    }
    
    func sendPasswordReset(to email: String) {
        client.sendResetPasswordEmail(email) { (error) in
            guard error == nil else {
                print("Reset password email not sent: \(error!.localizedDescription)")
                return
            }
            
            print("Password reset email sent.")
        }
    }
    
}
