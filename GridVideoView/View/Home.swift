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

    @Namespace var animation

    @StateObject var playerModel = VideoPlayerViewModel()

    var body: some View {
        ZStack {
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

                    LazyVGrid(columns: columns, content: {
                        ForEach(videos) { video in
                            VideoPlayerView(player: video.player)
                                .cornerRadius(15)
                                .matchedGeometryEffect(id: video.id, in: animation)
                                .frame(height: 280)
                                .onTapGesture {
                                withAnimation {
                                    playerModel.selectedVideo = video
                                    playerModel.showPlayer = true
                                }
                            }
                        }
                    })
                        .padding()

                }
            }

            if playerModel.showPlayer {
                VideoPlayerView(player: playerModel.selectedVideo.player)
                    .offset(playerModel.offset)
                    .scaleEffect(playerModel.scale)
                    .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
                    .onAppear {
                    playerModel.selectedVideo.player.play()
                }
                    .ignoresSafeArea(.all, edges: .all)
            }
        }
    }

    func onChanged(value: DragGesture.Value) {

        if value.translation.height > 0 {

            playerModel.offset = value.translation

            let screenHeight = UIScreen.main.bounds.height - 50

            let progress = playerModel.offset.height / screenHeight

            if 1 - progress > 0.5 {
                playerModel.scale = 1 - progress
            }
        }

    }

    func onEnd(value: DragGesture.Value) {

        withAnimation(.default) {
            playerModel.offset = .zero
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
