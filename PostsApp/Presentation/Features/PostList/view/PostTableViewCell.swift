//
//  PostTableViewCell.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var authorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
