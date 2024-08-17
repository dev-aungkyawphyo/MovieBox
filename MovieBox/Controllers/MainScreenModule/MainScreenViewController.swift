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
    
    // MARK: ViewModel
    var viewModel: MainViewModel = MainViewModel()

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
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}
 
