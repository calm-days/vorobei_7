//
//  ContentView.swift
//  vorobei_7
//
//  Created by Raman Liukevich on 17/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State var showOpenView = false

    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height

            VStack {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue)
                            .frame(width: showOpenView ? 90 : 300,
                                   height: showOpenView ? 50 : 400)

                        Text(showOpenView
                             ? "Open"
                             : "\(Image(systemName: "arrowshape.backward.fill"))  Back")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(width: 100,
                                   height: 50)
                            .offset(x: showOpenView ? 0 : -95,
                                    y: showOpenView ? 0 : -170)
                            .animation(.easeInOut(duration: 0.1), value: showOpenView)
                            .onTapGesture {
                                showOpenView.toggle()
                            }
                    }
                    .offset(x: showOpenView
                            ? screenWidth - 135
                            : screenWidth - 370,
                            y: showOpenView
                            ? screenHeight - 90
                            : screenHeight - 590)

                    .padding()
                }
            }
            .animation(.snappy(duration: 0.45), value: showOpenView)

        }
    }
}

#Preview {
    ContentView()
}
