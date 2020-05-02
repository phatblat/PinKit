//
//  Files.swift
//  PinKitTests
//
//  Created by Ben Chatelain on 5/1/20.
//

import Foundation

/// Bundle identifier for tests. Only works when built by Xcode
let testBundleIdentifier = "at.phatbl.PinKitTests"
let testBundle = Bundle(for: PostSpec.self)

extension Data {
    /// Unsafe initializer for loading data from string paths.
    /// - Parameter file: Relative path within the JSON folder
    init(from file: String) {
        let fileURL = Bundle.url(for: file)!
        print("fileURL: \(fileURL)")
        try! self.init(contentsOf: fileURL, options: .mappedIfSafe)
    }
}

extension Bundle {
    /// Locates a JSON response file from the test bundle.
    ///
    /// - Parameter fileName: Name of file to locate.
    /// - Returns: URL to file.
    static func url(for file: String) -> URL? {
        return testBundle.url(for: file)
    }

    /// Builds a URL for a file in the JSON directory of the current bundle.
    ///
    /// - Parameter file: Name of file to locate.
    /// - Returns: URL to file.
    func url(for file: String) -> URL? {
        guard let path = self.path(forResource: file.fileNameWithoutExtension,
                                   ofType: file.fileExtension,
                                   inDirectory: "JSON")
            else { fatalError("Unable to load file \(file)") }

        return URL(fileURLWithPath: path)
    }
}

extension String {
    /// Returns the file name before the extension.
    var fileNameWithoutExtension: String {
        return (self as NSString).deletingPathExtension
    }

    /// Returns the file extension.
    var fileExtension: String {
        return (self as NSString).pathExtension
    }
}
