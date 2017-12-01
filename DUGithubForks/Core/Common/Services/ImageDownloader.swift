//
//  ImageDownloader.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import UIKit

typealias ImageHandler = (UIImage) -> ()

struct ImageDownloader {
    static func download(with urlString: String, completion: @escaping ImageHandler) {
        guard let url = URL(string: urlString) else {
            print("Can't load image with url \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data, let image = UIImage(data: data) else {
                print("Can't load image with url \(urlString)")
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}
