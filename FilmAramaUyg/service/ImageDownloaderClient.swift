//
//  ImageDownloaderClient.swift
//  FilmAramaUyg
//
//  Created by Talya Kuvvet on 29.10.2024.
//

import Foundation

class ImageDownloaderClient: ObservableObject {
    
    @Published var indirilenGorsel : Data?
    
    func gorselIndır(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response , error in
            guard let data = data, error == nil else {
                return
            }
            
            self.indirilenGorsel = data
        }.resume()
        
    }
}

