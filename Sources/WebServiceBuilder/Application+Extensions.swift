//
//  Application+Extensions.swift
//  
//
//  Created by Daniel Marriner on 22/07/2023.
//

import Foundation
import Vapor
import Fluent

public extension Application
{
    func configure(service: APICapability) throws
    {
        if let api = service as? API
        {
            for collection in api.routeCollections
            {
                try register(collection: collection)
            }
        }

        if let fileServer = service as? FileServer
        {
            try fileServer.setupPublicDirectoryHierarchy()
        }

        if let viewsProvider = service as? LeafViewProvider
        {
            try viewsProvider.setupResourcesDirectoryHierarchy()
        }

        if let migrationsProvider = service as? MigrationsProvider
        {
            self.migrations.add(migrationsProvider.migrations)
        }
    }
}
