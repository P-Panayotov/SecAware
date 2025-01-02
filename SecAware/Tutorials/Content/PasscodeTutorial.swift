//
//  PasscodeTutorial.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct PasscodeTutorial: Tutorial {
    var image: Image = Image(.personHoldingPhone)
    var title: String = "Strong Passcode"
    var sections: [TutorialSection] {
        [
            .init(title: "**Why Use a Strong Passcode?**", content: [
                "1. **Protect Personal Data:**\nYour device contains sensitive information, including messages, photos, bank details, and more.",
                "2. **Prevent Unauthorized Access:**\nA strong passcode makes it significantly harder for someone to access your device.",
                "3. **Comply with Security Best Practices:**\nSome apps and services require strong passcodes for secure operation.",
                "4. **Mitigate Theft Risks:**\nIf your device is lost or stolen, a strong passcode can safeguard your data."
            ]),
            .init(title: "**What is a Strong Passcode?**", content: [
                "A strong passcode:",
                "   • **Is Alphanumeric:** Combines letters, numbers, and symbols.",
                "   • **Is Long:** At least 8 characters, but preferably more.",
                "   • **Avoids Predictability:** Does not use simple sequences like \"123456\" or easily guessed words like \"password\".",
                "   • **Is Unique:** Not reused across devices, accounts, or websites.",
            ]),
            .init(title: "**How to Set Up a Strong Passcode**", content: [
                "1. **Open the Settings App**\n   • Go to **Settings** on your iPhone or iPad.",
                "2. **Navigate to Passcode Settings**\n   • Tap **Face ID & Passcode** (or **Touch ID & Passcode**) and enter your current passcode.",
                "3. **Change Your Passcode**\n   • Scroll down and select **Change Passcode**.\n   • Enter your current passcode, then choose **Passcode Options**.",
                "4. **Choose a Strong Option**\n   • Select **Custom Alphanumeric Code** for the strongest level of security.\n   • Create a unique passcode that includes a mix of letters, numbers, and symbols.",
            ]),
            .init(title: "**Additional Security Features**", content: [
                "1. **Enable Face ID or Touch ID**\n   • Biometric authentication adds an extra layer of security and convenience.\n   • Go to **Face ID & Passcode** or **Touch ID & Passcode** in Settings.\n   • Follow the instructions to set up your face or fingerprint.",
                "2. **Auto-Lock**\n   • Enable the feature to erase your data after 10 failed passcode attempts.\n   • In **Face ID & Passcode** or **Touch ID & Passcode**, toggle on **Erase Data**."
            ]),
            .init(title: "**Best Practices for Strong Passcodes**", content: [
                "1. **Do Not Share Your Passcode**: Keep it private, even from friends and family.",
                "2. **Avoid Reusing Passcodes**: Use a unique passcode for every device and account.",
                "3. **Update Regularly**: Change your passcode periodically to stay secure.",
                "4. **Be Mindful of Observers**: Shield your screen when entering your passcode in public, or use privacy screen shield."
            ]),
            .init(title: "**The Benefits of Strong Passcodes, Face ID, and Touch ID**", content: [
                "By combining a strong passcode with Face ID or Touch ID, you maximize your device's security while maintaining ease of access. A strong passcode acts as a foundation, while biometrics add an additional safeguard against unauthorized access.",
            ])
        ]
    }
    
}
