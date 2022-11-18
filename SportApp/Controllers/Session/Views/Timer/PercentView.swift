//
//  PercentView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 17.11.2022.
//

import UIKit

extension TimerView {
    final class PercentView: BaseView {
        
        private let stackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            stack.spacing = 5
            return stack
        }()
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helvelticaRegular(with: 23)
            label.textColor = Resources.Color.textGray
            label.textAlignment = .center
            return label
        }()
        
        private let subTitleLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helvelticaRegular(with: 10)
            label.textColor = Resources.Color.subTitleGray
            label.textAlignment = .center
            return label
        }()
        
        func configure(title: String, with value: Int) {
            subTitleLabel.text = title
            percentLabel.text = "\(value)%"
        }
        
    }
}
extension TimerView.PercentView {
    override func setupViews() {
        super.setupViews()
        addViewWithoutTAMIC(stackView)
        stackView.addArrangedSubview(percentLabel)
        stackView.addArrangedSubview(subTitleLabel)

    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),

        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}
