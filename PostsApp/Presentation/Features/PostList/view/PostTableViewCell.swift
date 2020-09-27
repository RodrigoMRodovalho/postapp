//
//  PostTableViewCell.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import UIKit
import TagListView

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorProfilePictureImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorEmailLabel: UILabel!
    @IBOutlet weak var postPictureImageView: UIImageView!
    @IBOutlet weak var tagView: TagListView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postUrlLabel: UILabel!
    @IBOutlet weak var postLikesLabel: UILabel!
    @IBOutlet weak var postDatetimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowAndBorderForCell(with: self)
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension UITableViewCell{
    func shadowAndBorderForCell(with tableViewCell: UITableViewCell){
        tableViewCell.contentView.layer.borderWidth = 8
        tableViewCell.contentView.layer.borderColor = UIColor.systemPurple.cgColor
        tableViewCell.contentView.layer.masksToBounds = true
        tableViewCell.layer.shadowColor = UIColor.systemPurple.cgColor
        tableViewCell.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        tableViewCell.layer.shadowRadius = 2.0
        tableViewCell.layer.shadowOpacity = 1.0
        tableViewCell.layer.masksToBounds = false
        tableViewCell.layer.shadowPath = UIBezierPath(roundedRect:tableViewCell.bounds,
                                                      cornerRadius:tableViewCell.contentView.layer.cornerRadius).cgPath
    }
}
