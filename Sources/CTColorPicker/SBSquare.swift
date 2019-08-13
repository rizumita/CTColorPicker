//
//  SBSquare.swift
//  CTColorPicker
//
//  Created by 和泉田 領一 on 2019/08/04.
//

import SwiftUI

@available(OSX 10.15, iOS 13.0, *)
struct SBSquare: View {
    struct Square: View {
        var body: some View {
            GeometryReader { geometry in
                Path { path in
                    let center = CGPoint(x: min(geometry.size.width, geometry.size.height) / 2.0,
                                         y: min(geometry.size.width, geometry.size.height) / 2.0)
                    let p1 = CGPoint(x: min(geometry.size.width, geometry.size.height) / 2.0,
                                     y: 0.0)
                    let p2 = rotate(p1, center: center, angle: 90.0)
                    let p3 = rotate(p2, center: center, angle: 90.0)
                    let p4 = rotate(p3, center: center, angle: 90.0)
                    path.move(to: p1)
                    path.addLine(to: p2)
                    path.addLine(to: p3)
                    path.addLine(to: p4)
                }
            }
        }
    }
    
    private let scale: CGFloat
    @EnvironmentObject private var model: ColorPickerModel
    
    init(scale: CGFloat = 0.8) {
        self.scale = scale / 2.0 * sqrt(2.0)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Square()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [self.model.baseColor, .white]), startPoint: .trailing, endPoint: .leading))
                    .overlay(
                        Square()
                            .background(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top))
                )
                    .gesture(
                        DragGesture()
                            .onChanged {
                                self.model.setSaturation(point: $0.location.x, length: geometry.size.width * self.scale)
                                self.model.setBrightness(point: $0.location.y, length: geometry.size.height * self.scale)
                        }
                )
                Pointer()                    .position(self.model.saturationBrightnessPoint(length: geometry.size.width * self.scale))
            }
            .frame(width: geometry.size.width * self.scale,
                   height: geometry.size.height * self.scale, alignment: .center)

        }
    }
}

#if DEBUG
@available(OSX 10.15, iOS 13.0, *)
struct SBSquare_Previews: PreviewProvider {
    static var previews: some View {
        SBSquare()
    }
}
#endif
