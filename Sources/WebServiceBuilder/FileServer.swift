//
//  FileServer.swift
//  
//
//  Created by Daniel Marriner on 22/07/2023.
//

import Foundation

public protocol FileServer : APICapability
{
    var publicDirectoryPath: String { get }
    var publicDirectoryPathComponent: String { get }

    func setupPublicDirectoryHierarchy() throws
}

public extension FileServer
{
    func setupPublicDirectoryHierarchy() throws
    {
        guard let bundlePublicPath = pathOfFolder(identifiedByFileAtPath: "Public/public", withExtension: "txt") else { return }

        try? FileManager.default.removeItem(atPath: "\(publicDirectoryPath)\(publicDirectoryPathComponent)/static")
        try copyContentsOf(directoryAt: bundlePublicPath, to: "\(publicDirectoryPath)\(publicDirectoryPathComponent)")
    }
}
