//
//  APICapability.swift
//
//
//  Created by Daniel Marriner on 22/07/2023.
//

import Foundation

public protocol APICapability
{
    var bundle: Bundle { get }
    var logBehaviour: LogBehaviour { get }
}

internal extension APICapability
{
    func pathOfFolder(identifiedByFileAtPath path: String, withExtension ext: String) -> String?
    {
        return bundle
            .url(forResource: path, withExtension: ext)?
            .deletingLastPathComponent()
            .path
    }

    func copyContentsOf(directoryAt path: String, to destination: String) throws
    {
        let contents = try FileManager.default.contentsOfDirectory(atPath: path)
        log(" - Contents of path \(path) going to \(destination): \(contents)")
        try FileManager.default.createDirectory(atPath: destination, withIntermediateDirectories: true)
        for item in contents
        {
            let newPath = "\(path)/\(item)"
            let newDestination = "\(destination)/\(item)"
            log(" - Processing item \(item) for copy to \(newDestination)")
            var isDirectory: ObjCBool = false
            if FileManager.default.fileExists(atPath: newPath, isDirectory: &isDirectory)
            {
                if isDirectory.boolValue
                {
                    log(" - \(item) is a directory")
                    try FileManager.default.createDirectory(atPath: newDestination, withIntermediateDirectories: true)
                    log(" - Created new directory at \(newDestination)")
                    try copyContentsOf(directoryAt: newPath, to: newDestination)
                }
                else
                {
                    do
                    {
                        try FileManager.default.removeItem(atPath: newDestination)
                        log(" - Removed existing \(item) at \(newDestination)")
                    }
                    catch {}

                    do
                    {
                        try FileManager.default.copyItem(atPath: newPath, toPath: newDestination)
                        log(" - Copied \(item) to \(newDestination)")
                    }
                    catch
                    {
                        log(" - Copying \(item) to \(newDestination) failed: \(error)", .errorsAndWarnings)
                    }
                }
            }
        }
    }

    private func log(_ string: String, _ behaviour: LogBehaviour = .full)
    {
        if logBehaviour.rawValue >= behaviour.rawValue
        {
            print(string)
        }
    }
}
