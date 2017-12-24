//
//  MessageCell.swift
//  Smack
//
//  Created by Mark Rabins on 12/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
        
    // IBOutlets
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var messageBodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Message) {
        messageBodyLabel.text = message.message
        userNameLabel.text = message.userName
        userImage.image = UIImage(named: message.userAvatar)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        timeStampLabel.text = ""
    }
    

}
