//
//  BadgeBackground.swift
//  Babel Beauty
//
//  Created by Erin Hurlburt on 5/4/22.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + RectangleParamaters.adjustment)
                    )
                )

                RectangleParamaters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                }
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.65, y: 0.3),
                endPoint: UnitPoint(x: 0.7, y: 0.7)
            ))
        }
        .aspectRatio(1, contentMode: .fill)
        .frame(width: 100, height: 100, alignment: .topLeading)
    }
    static let gradientStart = Color(red: 250.0 / 250, green: 122.0 / 255, blue: 225.0 / 255)
    static let gradientEnd = Color(red: 253.0 / 255, green: 203.0 / 255, blue: 245.0 / 255)

}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}

