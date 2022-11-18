//
//  StatsItemView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 18.11.2022.
//

import UIKit

enum StatsItem {
    case heartRate(value: String)
    case averagePace(value: String)
    case totalSteps(value: String)
    case totalDistance(value: String)
    
    var data: StatsItemView.ItemData {
        switch self {
        case .heartRate(let value):
            return .init(image: Resources.Images.ImagesSession.heartBeatIcon,
                         velue: value + " / bpm",
                         title: Resources.Strings.Session.heartRate)
        case .averagePace(let value):
            return .init(image: Resources.Images.ImagesSession.speedIcon,
                         velue: value + " / km",
                         title: Resources.Strings.Session.averagePace)
        case .totalSteps(let value):
            return .init(image: Resources.Images.ImagesSession.stepsIcon,
                         velue: value,
                         title: Resources.Strings.Session.totalSteps)
            
        case .totalDistance(let value):
            return .init(image: Resources.Images.ImagesSession.mapsIcon,
                         velue: value + " km",
                         title: Resources.Strings.Session.totalDistance)
        }
    }
}

final class StatsItemView: BaseView {
  
    struct ItemData {
        let image: UIImage?
        let velue: String
        let title: String
    }
    
    private let imageView = UIImageView()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 18)
        label.textColor = Resources.Color.textGray
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 10)
        label.textColor = Resources.Color.inactive
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    func configure(with item: StatsItem) {
        imageView.image = item.data.image
        valueLabel.text = item.data.velue
        titleLabel.text = item.data.title
    }
    
}
extension StatsItemView {
   override func setupViews(){
       super.setupViews()
       addViewWithoutTAMIC(imageView)
       addViewWithoutTAMIC(stackView)
    
       stackView.addArrangedSubview(valueLabel)
       stackView.addArrangedSubview(titleLabel)

   }
    override func constraintViews(){
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    override func configureAppereance(){
        super.configureAppereance()
        
//        backgroundColor = .red
    }
}



