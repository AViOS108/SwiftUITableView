//
//  DetailView.swift
//  SwiftUITableView
//
//  Created by Anurag Bhakuni on 05/08/21.
//

import SwiftUI

struct DetailView: View {
    var landmark : Landmark

    var body: some View {
        
        VStack{
            Image(landmark.photo).resizable().scaledToFit()
                .font(.headline)
            Text(landmark.landmarkDescription)
                .font(.headline)
                Spacer()
        }.navigationBarTitle( Text(landmark.name), displayMode: .inline)

        
     
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(landmark: Landmark(landmarkID: 15, name: "Gateway of India", photo: "goi", landmarkDescription: "he Gateway of India is an arch-monument built in the early twentieth century in the city of Mumbai, in the Indian state of Maharashtra. It was erected to commemorate the landing in December 1911 at Apollo Bund"))
    }
}
