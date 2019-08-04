//
//  Functions.swift
//  CTColorPicker
//
//  Created by 和泉田 領一 on 2019/08/04.
//

import SwiftUI

func getLength(_ geometry: GeometryProxy) -> CGFloat {
    min(geometry.size.width, geometry.size.height)
}

func rotate(_ point: CGPoint, center: CGPoint, angle: CGFloat) -> CGPoint {
    let s = sin(.pi / 180.0 * angle)
    let c = cos(.pi / 180.0 * angle)
    
    let xPC = point.x - center.x
    let yPC = point.y - center.y
    
    let xNew = c * xPC - s * yPC + center.x
    let yNew = s * xPC + c * yPC + center.y
    
    return CGPoint(x: xNew, y: yNew)
}

func angle(_ point: CGPoint, center: CGPoint) -> CGFloat {
    var r = atan2(center.y - point.y, center.x - point.x)
    if r < 0 {
        r = r + 2.0 * CGFloat.pi
    }
    return floor(r * 360.0 / (2.0 * CGFloat.pi))
}
