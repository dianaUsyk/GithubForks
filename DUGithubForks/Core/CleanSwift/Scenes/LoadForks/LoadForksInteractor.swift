//
//  LoadForksInteractor.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright (c) 2017 Di. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoadForksBusinessLogic {
    func loadForks(request: LoadForks.FetchRepository.Request)
    func loadDefaultFieldValues(request: LoadForks.SetDefaultFields.Request)
}

protocol LoadForksDataStore {
    var repository: FetchedRepository? { get set }
}

class LoadForksInteractor: LoadForksBusinessLogic, LoadForksDataStore {
    var presenter: LoadForksPresentationLogic?
    lazy var worker: RepositoryWorker = {
        return RepositoryWorker()
    }()
    var repository: FetchedRepository?

    // MARK: Do something

    func loadForks(request: LoadForks.FetchRepository.Request) {
        guard loadingRequestIsValid(request: request) else {
            let response = LoadForks.FetchRepository.Response(repository: nil, isError: true, errorMessage: "Enter parameters")
            presenter?.presentListForkes(response: response)
            return
        }
        
        worker.fetchRepository(with: request.fields.repoName, ownerName: request.fields.ownerName, completion: { [weak self] (result) in
            
            let response: LoadForks.FetchRepository.Response!
            
            switch result {
            case let .failure(error):
                self?.repository = nil
             response = LoadForks.FetchRepository.Response(repository: nil, isError: true, errorMessage: error.localizedDescription)
            case let .success(some):
                self?.repository = some
                response = LoadForks.FetchRepository.Response(repository: some, isError: false, errorMessage: nil)
            }
            
            self?.presenter?.presentListForkes(response: response)
        })
    }
    
    func loadDefaultFieldValues(request: LoadForks.SetDefaultFields.Request) {
        let response = LoadForks.SetDefaultFields.Response(fields: LoadForks.FormFieldes(repoName: ForksLoadingSettings.defaultRepoName, ownerName: ForksLoadingSettings.defaultOwnerName))
        presenter?.presentDefaultFieldValues(response: response)
    }
    
    fileprivate func loadingRequestIsValid(request: LoadForks.FetchRepository.Request) -> Bool {
        return request.fields.repoName.count != 0 && request.fields.ownerName.count != 0
    }
}