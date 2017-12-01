//
//  ImagesStore.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import UIKit

struct ImagesStore {
    private static var cachedImages = [String : UIImage]()
    
    static func image(with urlString: String, completion: @escaping ImageHandler) {
        if let cachedImage = cachedImages[urlString] {
            completion(cachedImage)
        } else {
            ImageDownloader.download(with: urlString, completion: { (downloadedImage) in
                cachedImages[urlString] = downloadedImage
                completion(downloadedImage)
            })
        }
    }
    
    static func drain() {
        cachedImages = [String : UIImage]()
    }
}
