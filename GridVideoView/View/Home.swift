//
//  Home.swift
//  GridVideoView
//
//  Created by Abdullah Karaboğa on 18.02.2023.
//

import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var scheme

    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: { }, label: {
                    Image(systemName: "person.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.pink)
                })

                Button(action: { }, label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22))
                        .foregroundColor(.primary)
                })

                Spacer()

                Button(action: { }, label: {
                    Image(systemName: "person.fill.badge.plus")
                        .font(.system(size: 22))
                        .foregroundColor(.pink)
                })

            }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .overlay(

                Text("Discover")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

            )
                .background(scheme == .dark ? Color.black : Color.white)
                .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 0, y: 5)


            ScrollView {

                LazyVGrid(columns: columns,content: {
                    ForEach(videos) { video in
                        Text("Hello")
                    }
                })
                .padding()

            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
