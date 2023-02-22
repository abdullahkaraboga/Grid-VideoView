//
//  VideoPlayerViewMOdek.swift
//  GridVideoView
//
//  Created by Abdullah Karaboğa on 18.02.2023.
//

import SwiftUI
import AVKit

class VideoPlayerViewModel: ObservableObject {

    @Published var showPlayer = false
    @Published var offset: CGSize = .zero
    @Published var scale: CGFloat = 1
    
    @Published var selectedVideo : Video = Video(player: AVPlayer())

}
