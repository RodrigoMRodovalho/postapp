//
//  PostTableViewCell.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var authorProfilePictureImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorEmailLabel: UILabel!
    @IBOutlet weak var postPictureImageView: UIImageView!
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postUrlLabel: UILabel!
    @IBOutlet weak var postLikesLabel: UILabel!
    @IBOutlet weak var postDatetimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
