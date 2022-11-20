//
//  WABarView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 20.11.2022.
//

import UIKit

extension WABarView {
    struct Data {
        let value: String
        let heightParm: Double
        let title: String
    }
}

final class WABarView: BaseView {
    
    private let heightMultiplayer: Double
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resources.Color.textGray
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Color.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 9)
        label.textColor = Resources.Color.inactive
        return label
    }()
    
    init(data: Data){
        self.heightMultiplayer = data.heightParm
        super.init(frame: .zero)
        valueLabel.text = data.value
        titleLabel.text = data.title
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplayer = 0
        super.init(frame: .zero)    }
    
    private let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [String]) {
       
    }
}

extension WABarView {
    override func setupViews() {
        super.setupViews()
        addViewWithoutTAMIC(valueLabel)
        addViewWithoutTAMIC(barView)
        addViewWithoutTAMIC(titleLabel)

    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
           
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplayer, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}

