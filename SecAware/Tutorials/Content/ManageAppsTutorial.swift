//
//  ManageAppsTutorial.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct ManageAppsTutorial: Tutorial {
    var image: Image = Image(.mobileApps)
    var title: String = "Third-Party Apps"
    var sections: [TutorialSection] {
        [
            .init(title: "**Why Be Cautious of Third-Party Apps?**", content: [
                "1. **Security Risks**: Apps from untrusted sources may contain malware or spyware that compromises your data.",
                "2. **Privacy Concerns**: Some apps collect excessive personal information without a clear purpose.",
                "3. **Device Stability**: Poorly coded apps can cause crashes, drain battery life, or slow down your device.",
                "4. **Fraud and Scams**: Unauthorized apps may mimic popular ones to steal sensitive information, like login credentials or payment details."
            ]),
            .init(title: "**Stick to Trusted Sources**", content: [
                "1. **Use the Official App Store**\n   • Download apps exclusively from the Apple App Store, where apps are vetted for security and compliance.\n   • Apps on the App Store must meet Apple’s strict guidelines, significantly reducing risks compared to third-party marketplaces.",
                "2. **Avoid Jailbreaking Your Device**\nJailbreaking bypasses Apple’s security measures, allowing apps from untrusted sources to be installed. This exposes your device to vulnerabilities and voids warranty protections.",
                "3. **Check App Reviews and Ratings**\n   • Before downloading, read user reviews and check the app’s ratings to assess its reliability.\n   • Be cautious of apps with few reviews or overly generic feedback, as they may be fake."
            ]),
            .init(title: "**What to Look for When Downloading Apps**", content: [
                "1. **Developer Information**\nCheck the developer’s name and website. Established companies or individuals with a track record of reputable apps are safer choices.",
                "2. **App Description**\nRead the app’s description carefully. Be wary of vague or overly promotional language that doesn’t explain the app’s functionality.",
                "3. **Permissions Requested**\nPay attention to the permissions requested during installation or first use. Avoid apps that ask for unnecessary access, such as:\n   • A flashlight app requesting location data.\n   • A photo-editing app accessing your microphone.",
                "4. **Regular Updates**\nLook for apps that are frequently updated, as this indicates active support and security maintenance"
            ]),
            .init(title: "**Managing App Permissions**", content: [
                "1. **Check Permissions Regularly**\n   • Go to **Settings > Privacy & Security** and review each category (e.g., Location Services, Photos, Camera, Microphone).\n   • Revoke permissions that don’t align with the app’s purpose.",
                "2. **Grant Permissions Selectively**\n   • Choose **Ask Next Time** or **While Using** the App instead of granting full access.\n   • Disable Precise Location unless the app truly requires it.",
                "3. **Review Permissions for Old Apps**\nPeriodically check permissions for apps you haven’t used in a while and revoke access if necessary."
            ]),
            .init(title: "**Signs of Risky Apps**", content: [
                "Be cautious if an app:\n   • Requests permissions unrelated to its functionality.\n   • Drains your battery abnormally.\n   • Displays excessive ads or pop-ups.\n   • Redirects you to suspicious websites.",
            ]),
            .init(title: "**Key Takeaways**", content: [
                "• **Only Download from Trusted Sources**: Stick to the App Store to minimize risks.",
                "• **Be Vigilant About Permissions**: Grant permissions sparingly and only when absolutely necessary.",
                "• **Review Apps Periodically**: Remove apps you no longer use and audit permissions for installed ones."
            ])
        ]
    }
    
}
