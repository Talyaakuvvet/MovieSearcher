//
//  FilmDetayViewmodel.swift
//  FilmAramaUyg
//
//  Created by Talya Kuvvet on 30.10.2024.
//

import Foundation
import SwiftUI

class FilmDetayViewmodel : ObservableObject {
    
    @Published var filmDetayi: filmDetaylariViewmodel?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId : String)
    {
        downloaderClient.filmDetayiniIndir(imdbID: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case.success(let filmDetay):
                DispatchQueue.main.async {
                    self.filmDetayi = filmDetaylariViewmodel(detay: filmDetay)
                }
                
                
            }
        }
    }
    
}

struct filmDetaylariViewmodel {
    
    let detay : FilmDetay
    
    var title : String {
        detay.title
    }
    var poster : String {
        detay.poster
    }
    var year : String {
        detay.year
    }
    var imdbId : String {
        detay.imdbId
    }
    var director : String {
        detay.director
    }
    var writer : String {
        detay.writer
    }
    var awards : String {
        detay.awards
    }
    var plot : String {
        detay.plot
    }
    
}

