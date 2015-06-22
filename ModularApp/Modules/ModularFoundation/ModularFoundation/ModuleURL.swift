//
//  ModuleURL.swift
//
//  Created by Brice Pollock on 6/12/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation

public enum ModuleURL: Printable {
    case HomeModuleURL
    case PlainOldFeatureModuleURL(featureUUID: String)
    
    public func moduleURL() -> NSURL? {
        let URL = NSURL(string: "pack-list-mobile://app")!
        return URL.URLByAppendingPathComponent(path)
    }
    
    public var description: String {
        return moduleURL()?.description ?? ""
    }
}

// MARK: Define URLs

public protocol Path {
    var path : String { get }
}

extension ModuleURL: Path {
    public var path: String {
        switch self {
        case .HomeModuleURL: return "/home"
        case .PlainOldFeatureModuleURL(let featureUUID): return "/plainOldFeature/\(featureUUID)"
        }
    }
}

// MARK: Routing

extension ModuleURL {
    public var routingPath: String {
        switch self {
        case .PlainOldFeatureModuleURL(let featureUUID): return "/plainOldFeature/:featureUUID"
        default: return path
        }
    }
}
