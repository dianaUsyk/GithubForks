//
//  Typealiases.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import Foundation

typealias FetchedRepository = RepoFirstForksQuery.Data.Repository
typealias FetchedResultRepository = Result<FetchedRepository>
typealias FetchedResultRepositoryHandler = (Result<FetchedRepository>) -> ()
