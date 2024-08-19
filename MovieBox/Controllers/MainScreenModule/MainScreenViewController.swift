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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    var cellDataSource: [Movie] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    private func defaultSetup() {
        self.title = "Main View"
        tableViewSetup()
        registerCells() 
        bindViewModel()
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self,
                  let isLoading = isLoading else { return }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating() 
                }
            }
        }
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else { return }
            self.cellDataSource = movies
            reloadTableView()
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

// MARK: - Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITableViewDelegate
extension MainScreenViewController: UITableViewDelegate {
    
    
    
}

// MARK: - UITableViewDataSource
extension MainScreenViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movieData = cellDataSource[indexPath.row]
        cell.textLabel?.text = viewModel.getMovieTitle(movieData)
        return cell
    }
    
}
 
