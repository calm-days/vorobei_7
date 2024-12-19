//
//  ContentView.swift
//  vorobei_7
//
//  Created by Raman Liukevich on 17/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State var isPressed: Bool = false

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ChangableLayout(isPressed: isPressed) {
                    RoundedRectangle(cornerRadius: isPressed ? 20 : 10)
                        .foregroundStyle(Color.init(hue: 0.89, saturation: 0.5, brightness: 0.6))
                    DoubleSizedButton(animation: .easeInOut(duration: 0.55)) {
                        withAnimation(.easeInOut(duration: 0.55)) {
                            isPressed.toggle()
                        }
                    }
                    .layoutPriority(1)
                }
                .padding(.bottom, isPressed ? 100 : 10)
                .padding(.trailing, isPressed ? 40 : 20)
            }
        }
    }
}

struct ChangableLayout: Layout {
    let isPressed: Bool

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        isPressed
        ? CGSize(width: proposal.width! * 0.9, height: proposal.height! * 0.6)
        : subviews.first(where: { $0.priority == 1})!.sizeThatFits(proposal)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        subviews.forEach {
            $0.place(at: bounds.origin, proposal: .init(bounds.size))
        }
    }
}


struct DoubleSizedButton: View {
    @State var isPressed: Bool = false
    let animation: Animation
    let action: () -> ()

    var body: some View {
        Button {
            action()
            withAnimation(animation) {
                isPressed.toggle()
            }
        } label: {
            ZStack {
                Text("\(Image(systemName: "arrowshape.backward.fill")) Back")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .opacity(isPressed ? 1 : 0)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                Text("Open")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .opacity(isPressed ? 0 : 1)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 30)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}


#Preview {
    ContentView()
}
