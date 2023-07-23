//
//  MigrationsProvider.swift
//  
//
//  Created by Daniel Marriner on 22/07/2023.
//

import Fluent

public protocol MigrationsProvider : APICapability
{
    var migrations: [Migration] { get }
}
