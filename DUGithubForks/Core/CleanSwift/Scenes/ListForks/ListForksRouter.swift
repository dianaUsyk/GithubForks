//
//  ListForksRouter.swift
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

@objc protocol ListForksRoutingLogic {
    func routeToSelectedFork(segue: UIStoryboardSegue?)
}

protocol ListForksDataPassing {
    var dataStore: ListForksDataStore? { get }
}

class ListForksRouter: NSObject, ListForksRoutingLogic, ListForksDataPassing {
    
    fileprivate enum Settings {
        static let selectedForkID = "ListForksID"
    }

    weak var viewController: ListForksViewController?
    var dataStore: ListForksDataStore?

    // MARK: Routing

    func routeToSelectedFork(segue: UIStoryboardSegue?) {
        guard let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: Settings.selectedForkID) as? ListForksViewController, var destinationDS = destinationVC.router?.dataStore else {
            return
        }
        
        navigateToSelectedFork(source: viewController!, destination: destinationVC)
        passDataToSelectedFork(source: dataStore!, destination: &destinationDS)
    }

    // MARK: Navigation

    func navigateToSelectedFork(source: ListForksViewController, destination: ListForksViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: Passing data

    func passDataToSelectedFork(source: ListForksDataStore, destination: inout ListForksDataStore) {
        guard let selectedRepository = source.selectedRepository else { return }
        destination.repository = selectedRepository
    }
}
