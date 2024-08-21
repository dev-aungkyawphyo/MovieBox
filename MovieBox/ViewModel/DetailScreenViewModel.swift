//
//  DetailScreenViewModel.swift
//  MovieBox
//
//  Created by Aung Kyaw Phyo on 22/08/2024.
//

import Foundation

class DetailScreenViewModel {
    
    var movie: Movie
    
    var posterImage: URL?
    var posterTitle: String
    var posterDescription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id
        self.posterTitle = movie.title ?? movie.name ?? ""
        self.posterDescription = "\(movie.overview ?? "") See more..."
        self.posterImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL(_ movieCode: String) -> URL? {
        return URL(string: "\(NetworkConstant.shared.imageSeverAddress) \(movieCode)")
    }
    
}
