//
//  PodcastCell.swift
//  podCast
//
//  Created by prabhat pankaj on 31/03/19.
//  Copyright © 2019 learnix. All rights reserved.
//

import Foundation
import UIKit

class PodcastCell: UITableViewCell { 
    @IBOutlet weak var podImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var fadedLabel: UILabel!
    
    var podCast: Podcast! {
        didSet{
            titleLabel.text = podCast.trackName
            descriptionLabel.text = podCast.artistName
            fadedLabel.text = "\(podCast.trackCount ?? 0)"
   
            podImage.layer.cornerRadius = 5
            guard let url = URL(string: podCast.artworkUrl60 ?? "") else {return}

            podImage.sd_setImage(with: url)
        }
    }
}
