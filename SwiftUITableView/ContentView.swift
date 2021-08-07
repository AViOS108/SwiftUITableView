//
//  ContentView.swift
//  SwiftUITableView
//
//  Created by Anurag Bhakuni on 05/08/21.
//

import SwiftUI
import CoreData

struct Student {
    var name: String
}


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    var cities = BundleDecoder.decodeLandmarkBundleJson()
    
    init() {
          UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
        }
    var body: some View {
//        List {
//
//            ForEach(cities,id: \.cityID){
//                citi in
//                Section(header: SectionHeader(city: citi)) {
//                    Text(citi.name)
//                }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                .background(Color.blue)
//            }
//
//
//
//        }.listStyle(GroupedListStyle())
       
        NavigationView {
            List {
                ForEach(cities,id: \.cityID){
                             citi in
                    Section(header:TableViewSeactionHeader(city: citi)
                    .background(Color.blue)
                    .listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0))
                    ) {
                        ForEach(citi.landmarks,id:\.landmarkID){
                            landmark in
                            
                        NavigationLink(
                            destination: DetailView(landmark: landmark),
                            label: {
                                TableViewCell(landmark: landmark)

                            })
                        }
                    }
                }.listStyle(GroupedListStyle())
                    
                    
                    
                }.navigationBarTitle("Tourist Places")
            
        }
        
        
     
            
            
            
           
        
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
