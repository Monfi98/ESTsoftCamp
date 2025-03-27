//
//  ContentView.swift
//  Day40
//
//  Created by 신승재 on 3/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showShareSheet = false
    @State private var image = UIImage()

    var body: some View {
        VStack(spacing: 20) {
            Text("SwiftUI와 UIKit 통합 예제")
                .font(.title)
                .padding()

            Button("이미지 공유하기") {
                // 현재 화면을 캡처
                let captured = VStack {
                    Text("SwiftUI와 UIKit 통합 예제")
                        .font(.title)
                        .padding()
                }
                self.image = captured.snapshot()
                self.showShareSheet = true
            }
            .padding()
        }
        .sheet(isPresented: $showShareSheet) {
            ActivityView(activityItems: [image])
        }
    }
}

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

#Preview {
  ContentView()
}
