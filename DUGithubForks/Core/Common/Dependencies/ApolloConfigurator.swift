//
//  ApolloConfigurator.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import Foundation
import Apollo

let graphlQLEndpointURL = "https://api.github.com/graphql"
let personalAccessToken = "c5d34eafa8589fd656e98c62a3123217be108878"

let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(personalAccessToken)"]
    let url = URL(string: graphlQLEndpointURL)!
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()
