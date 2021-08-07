//
//  TableViewCell.swift
//  SwiftUITableView
//
//  Created by Anurag Bhakuni on 05/08/21.
//

import SwiftUI

struct TableViewCell: View {
    var landmark : Landmark
    var body: some View{
        HStack {
            Image(landmark.photo).resizable().frame(width: 20, height: 20, alignment: .center)
            Text(landmark.name)
                .font(.headline)
                Spacer()
        }    }
}

struct TableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TableViewCell(landmark: Landmark(landmarkID: 1, name: "Anurag", photo: "anurag", landmarkDescription: "Anurag"))
    }
}
