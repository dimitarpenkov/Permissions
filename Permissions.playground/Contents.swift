import UIKit

struct PermissionsOptions: OptionSet {
    
    let rawValue: Int
    
    static let marketingEmails = PermissionsOptions(rawValue: 1 << 0)
    static let marketingSms = PermissionsOptions(rawValue: 1 << 1)
    static let marketingPush = PermissionsOptions(rawValue: 1 << 2)
    static let adSocialMedia = PermissionsOptions(rawValue: 1 << 3)
}

let permissionOptions = PermissionsOptions(rawValue: 15)

let marketingEmailsEnabled = permissionOptions.contains(.marketingEmails)
let marketingSmsEnabled = permissionOptions.contains(.marketingSms)
let marketingPushEnabled = permissionOptions.contains(.marketingPush)
let adSocialMediaEnabled = permissionOptions.contains(.adSocialMedia)

print(marketingEmailsEnabled, marketingSmsEnabled, marketingPushEnabled, adSocialMediaEnabled)


// second idea - without using OptionSet

//turning number to binary number with any size

struct Permission {
    var marketingEmails: Bool
    var marketingSms: Bool
    var marketingPush: Bool
    var adSocialMedia: Bool
}

func pad(string : String, toSize: Int) -> String {
  var padded = string
  for _ in 0..<(toSize - string.count) {
    padded = "0" + padded
  }
    return padded
}

let response = 15
let binaryString = pad(string: String(response, radix: 2), toSize: 4)
let digitsOfBinary = binaryString.compactMap { $0.wholeNumberValue }

let permission = Permission(
    marketingEmails: Bool(truncating: digitsOfBinary[0] as NSNumber),
    marketingSms: Bool(truncating: digitsOfBinary[1] as NSNumber),
    marketingPush: Bool(truncating: digitsOfBinary[2] as NSNumber),
    adSocialMedia: Bool(truncating: digitsOfBinary[3] as NSNumber)
)

print(permission)











