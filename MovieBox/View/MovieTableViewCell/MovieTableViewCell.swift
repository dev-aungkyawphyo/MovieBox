//
//  MovieTableViewCell.swift
//  MovieBox
//
//  Created by Aung Kyaw Phyo on 20/08/2024.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MovieTableViewCell"
        }
    }
    
    public static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    // MARK: Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        designableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func designableView() {
        containerView.addBorder(color: .label, width: 1)
        containerView.round()
        posterImageView.round(5)
    }
    
    func configCell(viewModel: MovieTableViewCellViewModel) {
        self.posterTitleLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.ratingLabel.text = viewModel.rating
        self.posterImageView.sd_setImage(with: viewModel.imageURL)
    }
    
}
