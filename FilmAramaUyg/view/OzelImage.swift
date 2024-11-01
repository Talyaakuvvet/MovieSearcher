//
//  OzelImage.swift
//  FilmAramaUyg
//
//  Created by Talya Kuvvet on 29.10.2024.
//

import SwiftUI

struct OzelImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url : String) {
        self.url = url
        self.imageDownloaderClient.gorselIndır(url: self.url)
    }
    
    var body: some View {
        
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder").frame(width: 90,height: 150)
        }
        
    }
}

#Preview {
    OzelImage(url: "https://m.media-amazon.com/images/M/MV5BNWE5MGI3MDctMmU5Ni00YzI2LWEzMTQtZGIyZDA5MzQzNDBhXkEyXkFqcGc@._V1_SX300.jpg")
}
