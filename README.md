<img src="SecAware/Assets.xcassets/AppIcon.appiconset/180.png" style="border-radius:5%;"/>

## Table of contents

* [Requirements](#requirements) 
* [Implementation](#implementation)
  1. [System checks](#1-system-checks)
  2. [OS Vulnerabilities](#2-os-vulnerabilities)
  3. [Limitations](#3-limitations)
* [Future Work](#future-work)
  

# SecAware

The motivation and the implementation of the SecAware project is driven by the need to address the disconnect between iOS users perceived security and the actual risks posed by app permission abuse. It has been observed that, despite iOS being regarded as a secure platform, users of iOS often exhibit lower levels of cybersecurity awareness compared to users of other platforms like Android. This gap in awareness increases users vulnerability to privacy breaches, especially when iOS applications request permissions that exceed their stated functionality. 

Research has highlighted that 98% of educational apps on iOS were found to abuse user permissions, revealing the widespread nature of this issue. Such findings confirm the importance of equipping users with the knowledge and tools to make informed decisions regarding app permissions, third-party keyboards and awareness of cybersecurity best practices. 

The SecAware project has been conceptualised to bridge this knowledge gap and promote proactive cybersecurity behaviour among iOS users. The application is designed to educate users about the risks linked to app permissions, assess the security implications of third-party keyboards and provide guidance on managing these permissions. Through the use of clear accessible language, interactive elements and personalised recommendations users will be encouraged to adopt safer practices.

By promoting better user understanding of cybersecurity threats SecAware intents to create a safer and more secure environment for iOS users. The ultimate goal is to enable users to take control of their own privacy and digital security, thereby reducing their potential exposure to cyber threats.

## Requirements

| Category | Feature | Description | Limitations |
| -------- | ------- | ----------- | ----------- |
| System health | SecAware version | The app will verify the current version against the latest available version. This check ensures that users benefit from the most recent security updates and features of the app itself. | None |
| | Sandbox (Jailbreak detection) | SecAware will attempt to detect if the device has been jailbroken. This check is vital because jailbreaking removes many of the security restrictions that iOS enforces, potentially exposing the device to various threats. | Apple does not provide public APIs to detect jailbreaking. Any methods used for jailbreak detection could be circumvented by more advanced jailbreaking techniques. |
| | Passcode/Biometrics check | The app will verify if a passcode or biometrics (Face ID or Touch ID) is enabled on the device. This is a basic but essential check, as passcodes and biometrics are the first lines of defence against unauthorised device access. | None |
|  | Third-Party keyboards | The app will scan for installed third-party keyboards. This check is critical because malicious keyboards can potentially function as keyloggers. | The app cannot inspect or monitor the activities of another third party app such as a custom keyboard, because of the app sandbox. |
|  | iOS version | SecAware will check the current iOS version and notify users if a new version is available. Keeping the OS up to date is vital for ensuring the device is protected with the latest security patches. | None |
| Educational Content | App Entitlements | Encouraging users to check which permissions they have granted to each app. For example, an app might have access to location data when location access isn't necessary | None |
|  | Strong Passcodes | Emphasising the importance of using strong passcodes, Face ID, or Touch ID. A strong passcode should be alphanumeric, long and not re-used on multiple devices or websites. | None |
|  | 2FA | Recommending that users enable two-factor authentication for their Apple ID to provide additional security against unauthorised account access | None |
|  | Being Cautious of Third-Party Apps | Advising users to only download apps from trusted sources (App Store) and to be aware of the permissions that apps request | None |
|  | Public Wi-Fi networks for sensitive data | Providing advice about connecting to public Wi-Fi networks and how to protect your data using a VPN. | None |
| iOS Vulnerabilities | Fetching and Filtering Vulnerabilities | The app will use resources such as cvedetails.com or https://nvd.nist.gov/developers/vulnerabilities to retrieve vulnerability information. The information will be filtered to only show vulnerabilities that apply to iOS. | The accuracy and reliability of vulnerability data depends on the external sources used. SecAware cannot automatically remediate vulnerabilities. |

## Implementation

### 1. System checks

**SecAware version**

Verifies that the user is on the most up-to-date app version. Apple provides an official API to query app store versions documented here https://developer.apple.com/documentation/appstoreconnectapi/read_app_store_version_information. Due to SecAware not being officially submitted and available on the AppStore this check is currently hardcoded.

**Sandbox (Jailbreak detection)**

Detect if the device has been jailbroken. It is important to be noted that this may be circumvented by more advanced jailbreaking techniques. The app is using a third-party framework when performing this checks called CheckJailBreakDevice which is available on GitHub here https://github.com/SachinSabat/CheckJailBreakDevice

**Passcode/Biometrics check**

Apple provides an official framework with APIs to evaluate device security policies called LocalAuthentication. This framework allows SecAware to evaluate the level of security on user device by calling 

```swift
LAContext().canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
```

**OS version**

Apply uses an API to identify if a newer OS version is available for a specific device type. The API is available at https://s.mzstatic.com/version and it uses plist format for its response. The response is very detailed and includes all OS and device types like Mac, iPad, Watch etc. It is important to identify the specific device type a user is using in order to identify its latest OS version available to download. Some older devices does not support newer OS versions, for example iPhone 5 supports up to iOS version 12 where latest models like iPhone 15 can run on latest iOS 18.

### 2. OS vulnerabilities

This module retrieves and filters vulnerability information from external sources, such as cvedetails.com and the National Vulnerability Database, to show only iOS-related vulnerabilities. The accuracy of this data depends on API provided by NIST on https://services.nvd.nist.gov/rest/json/cves/2.0 with a full documentation available on https://nvd.nist.gov/developers/vulnerabilities. This module depends on a networking framework developed by Panayot Panayotov and available on GitHub here https://github.com/hromni/SwiftAPIClient. NIST API supports filter by keywords and SecAware can then only fetch CVEs for specific OS and version based on user device.

### 3. Limitations

**iOS Sandbox**

The iOS sandbox restricts the ability of SecAware to monitor other apps, this including any third party keyboards. This limits the ability to prevent, scan and notify users about any keylogging activities.

**External Vulnerability Data**

## Future work

**Better Property List (plist) parsing**

Focus on enhancing the handling of Apple's Property List (plist) format when querying the latest iOS versions from their API responses.

**SecAware app updates**

Implement methods to automatically monitor the latest available App Store version of SecAware against the version currently installed on a user's device and notify user when newer version is available.

**Integration with other tools**

Integration with other security tools, such as VPN apps or password managers would be useful.

**CallKit to identify and block SPAM and SCAM calls**

Utilising Machine Learning (ML) with Apple's CallKit framework to enhance the blocking of incoming calls. CallKit provides APIs that allow developers to integrate their call blocking and identification features directly into the system's phone interface making the process seamless for the user. ML could be employed to analyse incoming call data such as phone numbers or call patterns to identify and block potential spam or scam calls more effectively than a simple block lists.

The accuracy of vulnerability data depends on external sources like NIST vulnerabilities API and the app cannot automatically fix or highlight any discrepancies.

**Jailbreak Detection Limitations**

The jailbreak detection is limited by the lack of public APIs from Apple, which means it could be circumvented by advanced techniques, or even rendered ineffective by future OS updates.
