//
//  NetworkConstants.swift
//  MovieBox
//
//  Created by Aung Kyaw Phyo on 18/08/2024.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        
    }
    
    public var apiKey: String {
        get {
            return "949d7b353dd77ddbba10faa299a9fd48"
        }
    }
    
    public var severAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageSeverAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
}
