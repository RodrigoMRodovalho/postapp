//
//  CommentTableViewCell.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 28/09/20.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var authorPictureImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var createdDatetimeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
