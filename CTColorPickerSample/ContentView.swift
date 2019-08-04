//
//  ContentView.swift
//  CTColorPickerSample
//
//  Created by 和泉田 領一 on 2019/08/03.
//

import SwiftUI
import CTColorPicker

struct ContentView: View {
    @State private var color: UIColor = .red
    var body: some View {
        VStack {
            ColorPicker(color: self.color) { color in
                self.color = color
            }

            Rectangle()
                .foregroundColor(Color(self.color))
        }.scaleEffect(0.8)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
