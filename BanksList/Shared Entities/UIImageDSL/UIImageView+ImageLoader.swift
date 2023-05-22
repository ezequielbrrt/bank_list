//
//  UIImageView+ImageLoader.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import UIKit

extension UIImageView {

    var imageLoader: ImageLoaderDSL {
        ImageLoaderDSL(self)
    }
}

struct ImageLoaderDSL {

    // MARK: - Private Properties

    private let imageView: UIImageView

    // MARK: - Initialization

    init(_ imageView: UIImageView) {
        self.imageView = imageView
    }

    // MARK: - Public Methods

    public func load(from url: URL,
                     completion: ((Result<UIImage, Error>) -> Void)? = nil) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let loadedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageView.image = loadedImage
                    }
                }
            } else if let error = error {
                completion?(.failure(error))
            }
        }
        
        task.resume()
    }
}
