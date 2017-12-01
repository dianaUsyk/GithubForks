//
//  Result.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
    
    var value: Value? {
        switch self {
        case let .success(some):
            return some
        default:
            return nil
        }
    }
    
    var errorMessage: String? {
        switch self {
        case let .failure(error):
            return error.localizedDescription
        default:
            return nil
        }
    }
    
    public init(value: Value) {
        self = .success(value)
    }
    
    public init(error: Error) {
        self = .failure(error)
    }
}
