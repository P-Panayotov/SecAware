//
//  2faTutorial.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct TwoFactorAuthTutorial: Tutorial {
    var image: Image = Image(.twoCactorAuthPhone)
    var title: String = "Two-Factor Authentication (2FA)"
    var sections: [TutorialSection] {
        [
            .init(title: "**Why Enable 2FA?**", content: [
                "1. **Enhanced Security**: Passwords alone are vulnerable to hacking, phishing and leaks. 2FA provides an additional layer of protection.",
                "2. **Protect Sensitive Data**: Your Apple ID secures personal information like iCloud photos, email, payment details and device backups.",
                "3. **Prevent Unauthorized Access**: With 2FA, even if someone knows your password, they can't access your account without the second factor."
            ]),
            .init(title: "**How 2FA Works**", content: [
                "When 2FA is enabled:",
                "   • **Log In with Your Password**: Enter your Apple ID and password as usual.",
                "   • **Verify Your Identity**: Apple sends a six-digit verification code to a trusted device or phone number.",
                "   • **Access Your Account**: Enter the code to confirm your identity and complete the login process."
            ]),
            .init(title: "**How to Enable 2FA for Your Apple ID**", content: [
                "1. **Open the Settings App**\n   • On your iPhone or iPad, open the **Settings** app.",
                "2. **Access Apple ID Settings**\n   • Tap your name at the top of the Settings menu.",
                "3. **Go to Password & Security**\n   • Select **Password & Security** from the Apple ID menu.",
                "4. **Enable Two-Factor Authentication**\n   • Tap Turn On **Two-Factor Authentication** and follow the on-screen instructions.",
                "5. **Verify Trusted Devices and Phone Numbers**\n   • Choose a phone number or trusted device where verification codes will be sent.\n   • Make sure these devices or numbers are accessible only to you."
            ]),
            .init(title: "**Best Practices for 2FA**", content: [
                "1. **Secure Your Trusted Devices**:\nKeep your trusted devices protected with strong passcodes and biometric authentication.",
                "2. **Use a Reliable Phone Number**:\nEnsure your trusted phone number is up to date and accessible.",
                "3. **Store Recovery Codes Securely**:\nIf provided, save backup recovery codes in a secure location, such as a password manager."
            ]),
            .init(title: "**What to Do If You Can’t Receive a Code**", content: [
                "If you don’t have access to your trusted device or phone number, you can request account recovery via the Apple ID website. This process may take some time, so ensure your contact information stays updated.",
            ]),
            .init(title: "**Benefits of Two-Factor Authentication**", content: [
                "• **Peace of Mind**: Your account remains secure even if your password is compromised.",
                "• **Real-Time Alerts**: Get notified of any login attempts, so you can act quickly if something seems suspicious.",
                "• **Compatibility**: 2FA works seamlessly across all your Apple devices, enhancing overall security."
            ]),
            .init(title: "**Stay Ahead of Cyber Threats**", content: [
                "By enabling two-factor authentication for your Apple ID, you significantly reduce the risk of unauthorized access and keep your personal data safe. Set up 2FA today and take control of your account’s security!",
            ])
        ]
    }
    
}
