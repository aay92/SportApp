//
//  SecondaryButton.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 08.11.2022.
//

import UIKit

final class SecondaryButton: UIButton {
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
        configureAppereance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
    
}

private extension SecondaryButton {
    
    func setupViews(){
        addViewWithoutTAMIC(label)
        addViewWithoutTAMIC(iconView)

    }
    
    func constraintViews(){
        NSLayoutConstraint.activate([
            
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            
        ])
    }
    
    func configureAppereance(){
        makeSystem(self)
        backgroundColor = Resources.Color.separator
        layer.cornerRadius = 14
        
        label.textColor = Resources.Color.active
        label.font = Resources.Fonts.helvelticaRegular(with: 15)
        label.textAlignment = .center
        
        iconView.image = Resources.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = Resources.Color.active
        
        
    }
}
