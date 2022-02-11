//
//  ContentView.swift
//  CustomDropdownMenu
//
//  Created by Everton Carneiro on 05/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var title = "Messages"
    var body: some View {
        NavigationView {

            VStack {
                HStack {
                    Text(title)
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding(.leading)

                List(0..<20) { i in
                    Text("Message #\(i + 1)")
                }
                .listStyle(.plain)
                .customDropdownMenu(items: [
                    DropdownItem(id: 1, title: "Messages", iconImage: Image(systemName: "envelope"), onSelect: {
                        title = "Messages"
                    }),
                    DropdownItem(id: 2, title: "Archived", iconImage: Image(systemName: "archivebox"), onSelect: {
                        title = "Arquived"
                    }),
                    DropdownItem(id: 3, title: "Trash", iconImage: Image(systemName: "trash"), onSelect: {
                        title = "Deleted"
                    })
                ])
 
            }
            .navigationTitle("E-mail")
            .navigationBarTitleDisplayMode(.inline)
            

        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
