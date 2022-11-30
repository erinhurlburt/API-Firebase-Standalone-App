//
//  RectangleParamaters.swift
//  Babel Beauty
//
//  Created by Erin Hurlburt on 5/4/22.
//

import CoreGraphics

struct RectangleParamaters {
    struct Segment {
        let line: CGPoint
        let control: CGPoint
    }
    
    static let adjustment: CGFloat = 0.085

        static let segments = [
            Segment(
                line:    CGPoint(x: 0.00, y: 0.20 + adjustment),
                control: CGPoint(x: 0.00, y: 0.25 + adjustment)
            ),
            Segment(
                line:    CGPoint(x: 0.00, y: 0.70),
                control: CGPoint(x: 0.00, y: 0.75)
            ),
            Segment(
                line:    CGPoint(x: 0.00, y: 0.70),
                control: CGPoint(x: 0.00, y: 0.70)
            ),
            Segment(
                line:    CGPoint(x: 0.00, y: 0.80 - adjustment),
                control: CGPoint(x: 0.00, y: 0.75 - adjustment)
            )
        ]
    
}
