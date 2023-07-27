//
//  LeafViewProvider.swift
//  
//
//  Created by Daniel Marriner on 22/07/2023.
//

import Foundation

public protocol LeafViewProvider : APICapability
{
    var resourcesDirectoryPath: String { get }
    var resourcesDirectoryPathComponent: String { get }

    func setupResourcesDirectoryHierarchy() throws
}

public extension LeafViewProvider
{
    func setupResourcesDirectoryHierarchy() throws
    {
        guard let bundleResourcesPath = pathOfFolder(identifiedByFileAtPath: "resources", withExtension: "txt") else { return }

        try? FileManager.default.removeItem(atPath: "\(resourcesDirectoryPath)Views/\(resourcesDirectoryPathComponent)")
        try copyContentsOf(directoryAt: bundleResourcesPath + "/Views", to: "\(resourcesDirectoryPath)Views/\(resourcesDirectoryPathComponent)")
    }
}
