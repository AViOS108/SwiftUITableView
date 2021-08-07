//
//  TableViewSeactionHeader.swift
//  SwiftUITableView
//
//  Created by Anurag Bhakuni on 05/08/21.
//

import SwiftUI

struct TableViewSeactionHeader: View {
    var city : City
    var body: some View{
        HStack {
            Text(city.name)
                .font(.headline)
                .foregroundColor(.white)
                .padding()

                Spacer()
        }
    }
}

struct TableViewSeactionHeader_Previews: PreviewProvider {
    static var previews: some View {
        TableViewSeactionHeader(city: City(cityID: 1, name: "a", landmarks: [ Landmark(landmarkID: 1, name: "Anurag", photo: "anurag", landmarkDescription: "Anurag")]))
    }
}
