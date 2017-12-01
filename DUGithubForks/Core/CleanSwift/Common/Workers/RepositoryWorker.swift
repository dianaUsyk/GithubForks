//
//  RepositoryWorker.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import Foundation

enum FetchError: Error {
    case noData
}

struct RepositoryWorker {
    
    func fetchRepository(with name: String, ownerName: String, completion: @escaping FetchedResultRepositoryHandler) {
        
        let repoQuery = GetRepoQuery(repo_owner: ownerName, repo_name: name)
        apollo.fetch(query: repoQuery) { (result, error) in
            
            let convert: (GetRepoQuery.Data.Repository?) -> FetchedRepository? = {(fetchedRepository) in
                guard let fetchedRepository = fetchedRepository else { return nil }
                return FetchedRepository(snapshot: fetchedRepository.snapshot)
            }
            
            let resultRepository: FetchedResultRepository = self.resultRepository(result: result?.data?.repository, error: error, convert: convert)
            
            completion(resultRepository)
        }
    }
    
    func fetchRepositoryForks(with name: String, ownerName: String, forksCount: Int, after: String?, completion: @escaping FetchedResultRepositoryHandler) {
        if let after = after {
            fetchNextForks(with: name, ownerName: ownerName, forksCount: forksCount, after: after, completion: completion)
        } else {
            fetchFirstForks(with: name, ownerName: ownerName, forksCount: forksCount, completion: completion)
        }
    }
    
}

fileprivate typealias ForksLoading = RepositoryWorker
fileprivate extension ForksLoading {
    func fetchFirstForks(with name: String, ownerName: String, forksCount: Int, completion: @escaping FetchedResultRepositoryHandler) {
        let firstForksQuery = RepoFirstForksQuery(repo_owner: ownerName, repo_name: name, forks_count: forksCount)
        apollo.fetch(query: firstForksQuery) { (result, error) in
            
            let convert: (FetchedRepository?) -> FetchedRepository? = {(fetchedRepository) in
                return fetchedRepository
            }
            let resultRepository: FetchedResultRepository = self.resultRepository(result: result?.data?.repository, error: error, convert: convert)
            
            completion(resultRepository)
        }
    }
    
    func fetchNextForks(with name: String, ownerName: String, forksCount: Int, after: String, completion: @escaping FetchedResultRepositoryHandler) {
        let nextForksQuery = RepoNextForksQuery(repo_owner: ownerName, repo_name: name, forks_count: forksCount, end_cursor: after)
        apollo.fetch(query: nextForksQuery) { (result, error) in
            
            let convert: (RepoNextForksQuery.Data.Repository?) -> FetchedRepository? = {(fetchedRepository) in
                guard let fetchedRepository = fetchedRepository else { return nil }
                return FetchedRepository(snapshot: fetchedRepository.snapshot)
            }
            
            let resultRepository: FetchedResultRepository = self.resultRepository(result: result?.data?.repository, error: error, convert: convert)
            
            completion(resultRepository)
        }
    }
    
    func resultRepository<T>(result: T?, error: Error?, convert: (T?) -> FetchedRepository?) -> FetchedResultRepository {
        guard nil == error else {
            return FetchedResultRepository(error: error!)
        }
        
        if let repository = convert(result) {
            return FetchedResultRepository(value: repository)
        } else {
            return FetchedResultRepository(error: FetchError.noData)
        }
    }
}

