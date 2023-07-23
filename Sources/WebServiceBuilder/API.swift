//
//  API.swift
//  
//
//  Created by Daniel Marriner on 22/07/2023.
//

import Vapor

public protocol API : APICapability
{
    var routeCollections: [RouteCollection] { get }
}
