//
//  MainViewModel.swift
//  MovieBox
//
//  Created by Aung Kyaw Phyo on 18/08/2024.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableViewCellViewModel ]> = Observable(nil)
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        APIClient.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableViewCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
}

