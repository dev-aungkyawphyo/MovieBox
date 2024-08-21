//
//  DetailScreenViewController.swift
//  MovieBox
//
//  Created by Aung Kyaw Phyo on 22/08/2024.
//

import UIKit
import SDWebImage

class DetailScreenViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterTitleLabel: UILabel!
    @IBOutlet weak var posterdescriptionLabel: UILabel!
    
    // MARK: ViewModel
    var viewModel: DetailScreenViewModel
    
    init(viewModel: DetailScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailScreenViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        self.title = "Details"
        configure()
    }

    func configure() {
        posterTitleLabel.text = viewModel.posterTitle
        posterdescriptionLabel.text = viewModel.posterDescription
        posterImageView.sd_setImage(with: viewModel.posterImage)
    }

}
