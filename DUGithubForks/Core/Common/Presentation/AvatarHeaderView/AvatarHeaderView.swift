//
//  AvatarHeaderView.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import UIKit

class AvatarHeaderView: UIView {
    
    @IBOutlet weak var avatarImageView: AvatarView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private enum Settings {
        static let nibName = "AvatarHeaderView"
        static let standartHeight: CGFloat = 200.0
        
        enum Animation {
            static let scaleFactor: CGFloat = 0.5
            
            static let duration = 2.0
            static let delay = 0.2
            static let springDamping: CGFloat = 0.2
            static let initialSpringVelocity: CGFloat = 0.0
        }
    }
    
    static var standartHeight = Settings.standartHeight
    
    class func headerView() -> AvatarHeaderView {
        return Bundle.main.loadNibNamed(Settings.nibName, owner: self, options: nil)?.first as! AvatarHeaderView
    }
    
    func update(with avatarURL: String, title: String) {
        titleLabel.text = title
        avatarImageView.image = nil
        ImagesStore.image(with: avatarURL) { image in
            self.avatarImageView.image = image
        }
    }
    
    func animate() {
        avatarImageView.transform = CGAffineTransform.init(scaleX: Settings.Animation.scaleFactor, y: Settings.Animation.scaleFactor)
        UIView.animate(withDuration: Settings.Animation.duration, delay: Settings.Animation.delay, usingSpringWithDamping: Settings.Animation.springDamping, initialSpringVelocity: Settings.Animation.initialSpringVelocity, options: [], animations: {
            self.avatarImageView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
