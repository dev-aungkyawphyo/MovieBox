//
//  APIClient.swift
//  MovieBox
//
//  Created by Aung Kyaw Phyo on 18/08/2024.
//

import Foundation

enum APIError: String, Error {
    case internetConnectionError = "Connection Error!\nPlease check your internet connection."
    case noServerResponse = "Server Error!\nNo response from server.\nPlease contact the support for help."
    case InvalidURL
    case canNotParseData
}

public class APIClient {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMoviesModel, APIError>) -> Void) {
        let urlString = NetworkConstant.shared.severAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.InvalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                let data = data
                let result = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data!)
                completionHandler(.success(result!))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }
        .resume()
    }
    
}
