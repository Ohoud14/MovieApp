//
//  MoviesListView.swift
//  MovieApp
//
//  Created by Ohoud  on 14/08/2024.
//

import SwiftUI

struct MoviesListView: View {
    @StateObject private var viewModel = MoviesViewModel()
    var body: some View {
        
        NavigationView {
            List(viewModel.movies) { movie in
                 VStack(alignment: .leading, spacing: 10) {
                        AsyncImage(url: URL(string: movie.big_image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Rating: \(movie.rating)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Year: \(movie.year)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(movie.description)
                            .font(.body)
                            .lineLimit(5)
                            .padding(.top)
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.purple)
                }
            }
        
            .onAppear {
                viewModel.fetchMovies()
            }
        }
    }

         struct MovieListView_Previews: PreviewProvider {
             static var previews: some View {
                 MoviesListView()
       }
   }

