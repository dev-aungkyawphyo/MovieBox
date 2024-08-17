//
//  MainViewModel.swift
//  MovieBox
//
//  Created by Aung Kyaw Phyo on 18/08/2024.
//

import Foundation

class MainViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
    
    func getData() {
        APIClient.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

