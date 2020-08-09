//
//  ContentView.swift
//  MultipleSheetsInSwiftUI
//
//  Created by Ramill Ibragimov on 09.08.2020.
//

import SwiftUI

struct PresentedSheet: Identifiable {
    var id: Int
    var backColor: Color { Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))}
}

struct ContentView: View {
    @State private var presentedSheet: PresentedSheet? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<99) { item in
                    Button(action: {
                        presentedSheet = .init(id: item)
                    }, label: {
                        HStack {
                            Text("Sheet")
                            Spacer()
                            Text("\(item)")
                        }
                    })
                }
            }.navigationTitle("Multiple Sheets")
        }.sheet(item: $presentedSheet) { (item) in
            ZStack {
                item.backColor
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Presented Sheet number:")
                        .font(.title)
                    Text("\(item.id)")
                        .font(.system(size: 50))
                }
                .foregroundColor(Color.white)
                .padding()
                .border(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
