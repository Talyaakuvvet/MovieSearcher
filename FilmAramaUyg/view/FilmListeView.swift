//
//  ContentView.swift
//  FilmAramaUyg
//
//  Created by Talya Kuvvet on 27.10.2024.
//

import SwiftUI

struct FilmListeView: View {
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    
    
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
        
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Movie to find", text: $aranacakFilm) {
                    self.filmListeViewModel.filmAramasıYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                }.padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(filmListeViewModel.filmler,id: \.imdbId) { Film in
                    NavigationLink {
                        DetayView(imdbId:Film.imdbId)
                    } label: {
                        HStack {
                            OzelImage(url: Film.poster)
                                .frame(width: 90,height: 130)
                            
                            VStack(alignment: .leading) {
                                Text(Film.title)
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                Text(Film.year)
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                }.navigationTitle(Text("Movie Details"))
            }
        }
    }
}

#Preview {
    FilmListeView()
}
