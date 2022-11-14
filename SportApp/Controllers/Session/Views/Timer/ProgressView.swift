//
//  ProgressView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 14.11.2022.
//

import UIKit

// Спрятал во внутрь TimerView, чтобы ProgressView не была глобальным классом. Доступ будет только у TimerView

extension TimerView {
    final class ProgressView: UIView {
        func drawProgress(with percent: CGFloat){
            
//          (15 + 40) * 2 - 15 Это отступ и 40 отступ до контента(до линии прогресса), умножаем на 2 так как с двух сторо
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngel = CGFloat.pi * 1 / 7
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngel,
                                          clockwise: true)
            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath
            defaultCircleLayer.strokeColor = Resources.Color.separator.cgColor
            defaultCircleLayer.lineWidth = 20
            defaultCircleLayer.strokeEnd = 1
            defaultCircleLayer.fillColor = UIColor.clear.cgColor
            defaultCircleLayer.lineCap = .round
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = Resources.Color.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
        
//            Координаты для точки
            let dotAngel = CGFloat.pi * (7 / 6 - (8 / 6.15 * percent))
            let dotPoint = CGPoint(x: cos(-dotAngel) * radius + center.x,
                                        y: sin(-dotAngel) * radius + center.y)
//            Точка двигается
            let dotPath = UIBezierPath()
            dotPath.move(to: dotPoint)
            dotPath.addLine(to: dotPoint)
            
            let bigDotLayer = CAShapeLayer()
            bigDotLayer.path = dotPath.cgPath
            bigDotLayer.fillColor = UIColor.clear.cgColor
            bigDotLayer.strokeColor = Resources.Color.active.cgColor
            bigDotLayer.lineCap = .round
            bigDotLayer.lineWidth = 20
           
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotPath.cgPath
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.lineCap = .round
            dotLayer.lineWidth = 8
            
//            Добавляем созданный circleLayer на основной layer
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)

        }
    }
}
