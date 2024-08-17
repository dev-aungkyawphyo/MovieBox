//
//  MainScreenViewController.swift
//  MovieBox
//
//  Created by Aung Kyaw Phyo on 17/08/2024.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main View"
    }

}
