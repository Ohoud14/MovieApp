//
//  movie.swift
//  MovieApp
//
//  Created by Ohoud  on 13/08/2024.
//

import Foundation
struct Movie: Identifiable, Decodable {
    
    let rank : Int
    let title :String
    let description : String
    let image : String
    let big_image : String
    let thumbnail : String
    let rating : String
    let id : String
    let year : Int
    let imdbid : String
    let imdb_link : String

 
}
