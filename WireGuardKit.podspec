Pod::Spec.new do |spec|
  spec.name = "WireGuardKit"
  spec.version = "0.6.0"
  spec.summary = "WireGuard for iOS and macOS"

  spec.description = <<-DESC
    This project contains an application for iOS and for macOS, as well as many components shared between the two of them.
    You may toggle between the two platforms by selecting the target from within Xcode.
  DESC

  spec.homepage = "https://mysterium.network"
  spec.license = { :type => "MIT", :file => "COPYING" }
  spec.author = "Mysterium Network"

  spec.ios.deployment_target = "15.0"
  spec.osx.deployment_target = "12.0"

  spec.source = { :git => "https://github.com/mysteriumnetwork/wireguard-apple.git", :tag => "#{spec.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.vendored_frameworks = "Frameworks/wg-go.xcframework"
  spec.swift_version = "5.7"

  spec.source_files = [
    "Sources/WireGuardKitC/**/*.{c,h}",
    "Sources/WireGuardKit/**/*.{swift}",
    "Sources/Shared/**/*.{swift}",
    "Sources/WireGuardKitGo/wireguard.h",
    "Sources/WireGuardNetworkExtension/**/*.{c,h,swift}",
  ]
  spec.exclude_files = [
    "Sources/WireGuardKitGo/out/**",
  ]
  spec.preserve_paths = [
    "Sources/WireGuardKitC/module.modulemap",
  ]
  spec.pod_target_xcconfig = {
    "SWIFT_INCLUDE_PATHS" => [
      "${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardKitC/**",
      "${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardKit/**",
      "${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardKitGo/wireguard.h",
      "${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/Shared/**/*",
      "${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardNetworkExtension/**/*",
    ],
    "HEADER_SEARCH_PATHS" => [
      "${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardKitGo/wireguard.h",
    ],
    "APPLICATION_EXTENSION_API_ONLY" => "YES",
  }
end
