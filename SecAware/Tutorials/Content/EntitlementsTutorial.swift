//
//  EntitlementsTutorial.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct EntitlementsTutorial: Tutorial {
    var image: Image = Image(.iOSAppEntitlements)
    var title: String = "App Entitlements"
    var sections: [TutorialSection] {
        [
            .init(title: "**Why You Should Review App Permissions**", content: [
                "**Protect Privacy:** Apps with unnecessary permissions can access sensitive information, such as your location or contacts.",
                "**Improve Battery Life:** Apps using features like GPS unnecessarily can drain your battery faster.",
                "**Reduce Security Risks:** Limiting permissions reduces the chance of your data being exposed in case of a security breach.",
                "**Declutter Your Device:** Permissions granted to apps you no longer use may still be active."
            ]),
            .init(title: "**Steps to Check App Permissions on iOS**", content: [
                "1. **Open the Settings App**\n   • Tap on the Settings app on your iPhone or iPad.",
                "2. **Access Privacy & Security**\n   • Scroll down and select Privacy & Security. This is where you’ll find a comprehensive list of all data types and features apps may request access to.",
                "3. **Review Each Permission Type**\n   • Tap on specific categories, such as Location Services, Contacts, Camera, Microphone, or Photos.\n   • Inside each category, you’ll see a list of apps that have requested access.",
                "4. **Adjust Permissions**\n   • Select an app to see its current permission settings.\n   • Change the settings to:\n      • **Allow While Using the App**\n      • **Ask Next Time**\n      • **Never**\n   • For location permissions, you may also see an option for **Precise Location**. Disable this if the app doesn’t need exact coordinates.",
                "5. **Check the Apps List**\n   • Alternatively, you can check permissions app-by-app:\n   • Go back to **Settings** and scroll to find individual apps.\n   • Tap an app, and you’ll see the permissions it has requested, which you can adjust."
            ]),
            .init(title: "**Regular Maintenance Tips**", content: [
                "1. **Audit Permissions Periodically**\n   • Set a reminder to review permissions every few months to ensure no unnecessary access is granted.",
                "2. **Revoke Permissions for Unused Apps**\n   • If you haven’t used an app in a while, consider revoking its permissions or uninstalling it entirely.",
                "3. **Be Cautious with New Apps**\n   • When installing a new app, consider whether the requested permissions are necessary. Choose **Ask Next Time** if unsure.",
                "4. **Enable App Tracking Transparency**\n   • Under **Privacy & Security**, go to **Tracking** and toggle off **Allow Apps to Request to Track** to prevent apps from tracking your activity across other apps and websites.",
            ]),
            .init(title: "**Examples of Unnecessary Permissions**", content: [
                "• **A weather app accessing your microphone** - Unless it has a voice command features, this may not be necessary.",
                "• **A flashlight app requesting location access** – This is a red flag since it doesn’t need your location to function."
            ]),
            .init(title: "**Benefits of Staying Vigilant**", content: [
                "By reviewing and managing app permissions regularly, you take control of your data and privacy. This ensures that apps only access what they truly need, reducing risks and improving your device’s performance."
            ])
        ]
    }
    
}
