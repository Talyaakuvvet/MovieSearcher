//
//  DetayView.swift
//  FilmAramaUyg
//
//  Created by Talya Kuvvet on 30.10.2024.
//

import SwiftUI

struct DetayView: View {
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewmodel()
    
    var body: some View {
        
        VStack(alignment: .leading,spacing:5) {
            HStack {
                Spacer()
                OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                    .frame(width: 225, height: 315, alignment: .center).padding(.vertical).shadow(radius: 20, x: 0, y: 8)
                Spacer()
            }
            VStack {
                HStack {
                    Spacer()
                    Text(filmDetayViewModel.filmDetayi?.title ?? "Movie name")
                        .font(.title).padding(.top)
                        .bold()
                        .foregroundColor(.blue)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(filmDetayViewModel.filmDetayi?.year ?? "year").font(.title2).padding(.bottom).bold()
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Text(filmDetayViewModel.filmDetayi?.plot ?? "plot")
                    .padding(.bottom).font(.title3)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Director:").font(.headline).bold()
                Text(filmDetayViewModel.filmDetayi?.director ?? "Director").font(.subheadline)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Writer:").font(.headline).bold()
                Text(filmDetayViewModel.filmDetayi?.writer ?? "Writer").font(.subheadline)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Awards:").font(.headline).bold()
                Text(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller gösterilecek").font(.subheadline)
                Spacer()
            }
            Spacer()
            
        }.onAppear (perform: {
            self.filmDetayViewModel
                .filmDetayiAl(imdbId: imdbId)
        })
    }
}

#Preview {
    DetayView(imdbId: "test")
}
