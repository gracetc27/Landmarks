//
//  PageControl.swift
//  Landmarks
//
//  Created by Grace couch on 22/04/2024.
//

import SwiftUI



struct PageControl2: View {
    let numberOfPages: Int
    @Binding var currentPage: Int
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                let selected: Bool = currentPage == index
                Button {
                    currentPage = index
                } label: {
                    Group {
                        if selected == true {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .foregroundStyle(.white)
                        } else {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .foregroundStyle(.gray)
                        }
                    }
                    .frame(width: 10, height: 10)
                    .padding(7)
                    .contentShape(.rect)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct Demo: View {
    @State var selectedPage = 0
    var body: some View {
        PageControl2(numberOfPages: 3, currentPage: $selectedPage)
            .background(.teal)
    }
}

#Preview("PageControl2") {
    Demo()
}
