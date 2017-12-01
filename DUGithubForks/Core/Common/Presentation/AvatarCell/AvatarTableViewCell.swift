//
//  AvatarTableViewCell.swift
//  DUGithubForks
//
//  Created by Di on 30.11.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {
    
    fileprivate enum Settings {
        static let defaultCellHeight: CGFloat = 60.0
        static let cellIdentifier = "AvatarCell"
    }
    
    @IBOutlet weak var avatarImageView: AvatarView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!

    static let defaultCellHeight = Settings.defaultCellHeight
    static let identifier = Settings.cellIdentifier
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.standartLightBlueColor
        selectedBackgroundView = bgColorView
    }
    
    func update(with avatarURL: String, title: String, accessory: String) {
        titleLabel.text = title
        
        avatarImageView.image = nil
        ImagesStore.image(with: avatarURL) { image in
            self.avatarImageView.image = image
        }
        countLabel.text = accessory
    }
}
