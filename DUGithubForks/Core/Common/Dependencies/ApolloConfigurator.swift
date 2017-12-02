//
//  ApolloConfigurator.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import Foundation
import Apollo

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// Uncomment next row

let personalGithubAccessToken = "Your_token"
let graphlQLEndpointURL = "https://api.github.com/graphql"

let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(personalGithubAccessToken)"]
    let url = URL(string: graphlQLEndpointURL)!
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()
