//
//  LoadForksRouter.swift
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

@objc protocol LoadForksRoutingLogic {
    func routeToListForks(segue: UIStoryboardSegue?)
}

protocol LoadForksDataPassing {
    var dataStore: LoadForksDataStore? { get }
}

class LoadForksRouter: NSObject, LoadForksRoutingLogic, LoadForksDataPassing {
    weak var viewController: LoadForksViewController?
    var dataStore: LoadForksDataStore?
  
  // MARK: Routing
  
    func routeToListForks(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! ListForksViewController
            var destinationDS = destinationVC.router!.dataStore!
            
            passDataToListForks(source: dataStore!, destination: &destinationDS)
        }
    }
  
    // MARK: Passing data

    fileprivate func passDataToListForks(source: LoadForksDataStore, destination: inout ListForksDataStore) {
        destination.repository = source.repository
    }
}
