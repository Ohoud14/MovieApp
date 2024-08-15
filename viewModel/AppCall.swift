//
//  AppCall.swift
//  MovieApp
//
//  Created by Ohoud  on 14/08/2024.
//


import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private var cancellable: AnyCancellable?

    func fetchMovies() {
        guard let url = URL(string: "https://imdb-top-100-movies.p.rapidapi.com/") else { return }

        var request = URLRequest(url: url)
        request.setValue("imdb-top-100-movies.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("766dfaeeaemsh201e0648ea12929p113540jsn7d8fca6d7018", forHTTPHeaderField: "x-rapidapi-key")
        request.httpMethod = "GET"

        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .catch { _ in Just([]) }
            .assign(to: \.movies, on: self)
    }
}
