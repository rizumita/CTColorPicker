//
//  HCircle.swift
//  CTColorPicker
//
//  Created by 和泉田 領一 on 2019/08/04.
//

import SwiftUI

@available(OSX 10.15, iOS 13.0, *)
struct HCircle: View {
    private let scale: CGFloat
    private var length: CGFloat = .zero
    @EnvironmentObject private var model: ColorPickerModel
    
    init(scale: CGFloat = 0.8) {
        self.scale = scale
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                Circle()
                    .fill(self.gradient)
                    .frame(width: getLength(geometry),
                           height: getLength(geometry),
                           alignment: .center)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged {
                                let center = CGPoint(x: getLength(geometry) / 2.0, y: getLength(geometry) / 2.0)
                                self.model.setHue(angle: angle($0.location, center: center) + 90.0)
                        }
                )
                Circle().scale(self.scale).fill(Color.white)
                Pointer()
                    .position(self.model.huePoint(r: self.middleR(geometry),
                                                  length: getLength(geometry)))
            }
        }
    }
    
    private func middleR(_ geometry: GeometryProxy) -> CGFloat {
        (getLength(geometry) + getLength(geometry) * scale) / 4.0
    }
    
    private var gradient: AngularGradient {
        AngularGradient(gradient: Gradient(colors: [Color(hex: "80ff00"),
                                                    Color(hex: "00ff00"),
                                                    Color(hex: "00ff80"),
                                                    Color(hex: "00ffff"),
                                                    Color(hex: "0080ff"),
                                                    Color(hex: "0000ff"),
                                                    Color(hex: "8000ff"),
                                                    Color(hex: "ff00ff"),
                                                    Color(hex: "ff0080"),
                                                    Color(hex: "ff0000"),
                                                    Color(hex: "ff8000"),
                                                    Color(hex: "ffff00"),
                                                    Color(hex: "80ff00")]),
                        center: .center)
    }
}

#if DEBUG
@available(OSX 10.15, iOS 13.0, *)
struct HCircle_Previews: PreviewProvider {
    static var previews: some View {
        HCircle()
    }
}
#endif
