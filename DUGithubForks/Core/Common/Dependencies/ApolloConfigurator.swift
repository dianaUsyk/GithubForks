//
//  ApolloConfigurator.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import Foundation
import Apollo

let personalGithubAccessToken = "d918 ee5a bd78 7fe7 e9fe 6a79 872b ab2ab 41f6 e83"
let graphlQLEndpointURL = "https://api.github.com/graphql"

let apollo: ApolloClient = {
    
    let configuration = URLSessionConfiguration.default
    let decoded = personalGithubAccessToken.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(decoded)"]
    let url = URL(string: graphlQLEndpointURL)!
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()
