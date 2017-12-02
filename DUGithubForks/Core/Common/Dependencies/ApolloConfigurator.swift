//
//  ApolloConfigurator.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import Foundation
import Apollo

let code = "A"
let personalGithubAccessToken = "032b6025aee8d78d98d30af11aca96ab7ec6604dA"
let graphlQLEndpointURL = "https://api.github.com/graphql"

let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(encodedToken)"]
    let url = URL(string: graphlQLEndpointURL)!
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()

let encodedToken: String = {
    let endIndex = personalGithubAccessToken.index(personalGithubAccessToken.endIndex, offsetBy: -code.count)
    let encodedTokenSubstring = personalGithubAccessToken[..<endIndex]
    return String(encodedTokenSubstring)
}()
