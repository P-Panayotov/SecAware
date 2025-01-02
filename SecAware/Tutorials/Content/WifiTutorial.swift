//
//  WifiTutorial.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct WifiTutorial: Tutorial {
    var image: Image = Image(.wiFi)
    var title: String = "Using Public Wi-Fi Networks"
    var sections: [TutorialSection] {
        [
            .init(title: "**The Risks of Public Wi-Fi**", content: [
                "1. **Unencrypted Connections**: Many public Wi-Fi networks don’t encrypt data, making it easy for hackers to intercept.",
                "2. **Man-in-the-Middle Attacks**: Cybercriminals can intercept communication between your device and the internet, stealing sensitive information.",
                "3. **Fake Hotspots**: Attackers may set up fake Wi-Fi networks that mimic legitimate ones to trick users into connecting.",
                "4. **Data Theft**: Without proper protection, your login credentials, banking information, or other sensitive data may be exposed."
            ]),
            .init(title: "**How to Use Public Wi-Fi Safely**", content: [
                "1. **Avoid Accessing Sensitive Data**\nDo not access bank accounts, make online purchases, or log in to accounts containing personal or financial data while on public Wi-Fi.",
                "2. **Verify the Network Name**\nConfirm the exact name of the public Wi-Fi network with staff to avoid connecting to fake networks.",
                "3. **Turn Off Automatic Connections**\nDisable automatic Wi-Fi connections to prevent your device from connecting to unsafe networks\n   • Go to **Settings > Wi-Fi** and turn off **Auto-Join** for public networks.",
                "4. **Forget Networks After Use**\nForget public networks after connecting to prevent automatic reconnection in the future.\n   • In **Settings > Wi-Fi**, tap the info icon (ℹ️) next to the network and select **Forget This Network**.",
                "5. **Disable File Sharing**\nEnsure file-sharing features are off to minimize vulnerability.\n   • On iOS, go to **Settings > AirDrop** and set it to **Receiving Off** when in public places."
            ]),
            .init(title: "**The Role of a VPN in Public Wi-Fi Security**", content: [
                "1. **Encrypts Your Data**\nA VPN encodes your internet traffic, making it unreadable to hackers or anyone attempting to intercept your connection.",
                "2. **Protects Your Identity**\nVPNs hide your IP address, adding a layer of anonymity and preventing websites or attackers from tracking your location.",
                "3. **Provides Secure Access**\nVPNs create a secure tunnel to the internet, allowing you to safely access sensitive data even on public networks."
            ]),
            .init(title: "**How to Set Up and Use a VPN**", content: [
                "1. **Choose a Reliable VPN Service**\nSelect a trustworthy VPN provider that prioritizes security and privacy, such as **NordVPN**, **ExpressVPN** or **ProtonVPN**.",
                "2. **Download the App**:\nDownload the VPN app from the App Store and install it on your device.",
                "3. **Connect to a VPN Server**:\nOpen the app, log in and connect to a server. For optimal speed, choose a server close to your physical location.",
                "4. **Enable Automatic VPN Connection**\nMany VPN apps offer an option to auto-connect when joining public Wi-Fi networks. Enable this feature for added convenience and security."
            ]),
            .init(title: "**What to Avoid on Public Wi-Fi**", content: [
                "• **Online Banking**: Save financial transactions for secured networks.",
                "• **Accessing Confidential Work Data**: Use a corporate VPN or wait until you’re on a secure network.",
                "• **Downloading Attachments or Apps**: Avoid downloading anything, as it might expose you to malware."
            ]),
            .init(title: "**Key Takeaways**", content: [
                "• Public Wi-Fi networks are convenient but inherently risky. Avoid accessing sensitive data without proper precautions.",
                "• A VPN is your best defense, providing encryption and security while browsing on public networks.",
                "• Stay vigilant by verifying networks, disabling automatic connections, and using HTTPS websites."
            ])
        ]
    }
    
}
