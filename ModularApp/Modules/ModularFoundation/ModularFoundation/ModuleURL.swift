//
//  ModuleURL.swift
//
//  Created by Brice Pollock on 6/12/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation

public enum ModuleURL: CustomStringConvertible {
    case homeModuleURL
    case plainOldFeatureModuleURL(featureUUID: String)
    
    public func moduleURL() -> URL? {
        let URL = Foundation.URL(string: "pack-list-mobile://app")!
        return URL.appendingPathComponent(path)
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
        case .homeModuleURL: return "/home"
        case .plainOldFeatureModuleURL(let featureUUID): return "/plainOldFeature/\(featureUUID)"
        }
    }
}

// MARK: Routing

extension ModuleURL {
    public var routingPath: String {
        switch self {
        case .plainOldFeatureModuleURL(let featureUUID): return "/plainOldFeature/:featureUUID"
        default: return path
        }
    }
}
