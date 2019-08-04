//
//  ColorPickerModel.swift
//  CTColorPicker
//
//  Created by 和泉田 領一 on 2019/08/04.
//

import Foundation
import SwiftUI
import Combine

class ColorPickerModel: ObservableObject {
    var objectWillChange = PassthroughSubject<UIColor, Never>()
    var baseColor: Color {
        Color(hue: Double(hue), saturation: 1.0, brightness: 1.0)
    }
    var color: UIColor = .red {
        willSet {
            objectWillChange.send(newValue)
        }
    }
    var hue: CGFloat {
        var hue: CGFloat = .zero
        color.getHue(&hue, saturation: .none, brightness: .none, alpha: .none)
        return hue
    }
    var saturation: CGFloat {
        var saturation: CGFloat = .zero
        color.getHue(.none, saturation: &saturation, brightness: .none, alpha: .none)
        return saturation
    }
    var brightness: CGFloat {
        var brightness: CGFloat = .zero
        color.getHue(.none, saturation: .none, brightness: &brightness, alpha: .none)
        return brightness
    }
    
    init(color: UIColor) {
        self.color = color
    }
    
    func huePoint(r: CGFloat, length: CGFloat) -> CGPoint {
        let center = CGPoint(x: length / 2.0, y: length / 2.0)
        let top = CGPoint(x: center.x, y: center.y - r)
        return rotate(top, center: center, angle: hue * 360.0)
    }
        
    func setHue(angle: CGFloat) {
        color = UIColor(hue: (angle + 180.0) / 360, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
    func saturationBrightnessPoint(length: CGFloat) -> CGPoint {
        CGPoint(x: length * saturation, y: length * (1.0 - brightness))
    }
    
    func setSaturation(point: CGFloat, length: CGFloat) {
        color = UIColor(hue: hue,
                        saturation: max(0.0, min(1.0, point / length)),
                        brightness: brightness,
                        alpha: 1.0)
    }
    
    func setBrightness(point: CGFloat, length: CGFloat) {
        color = UIColor(hue: hue,
                        saturation: saturation,
                        brightness: 1.0 - max(0.0, min(1.0, point / length)),
                        alpha: 1.0)
    }
}
