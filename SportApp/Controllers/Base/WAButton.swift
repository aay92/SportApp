//
//  WAButton.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 08.11.2022.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

final class WAButton: UIButton {
    
    private var type: WAButtonType = .primary
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    init(with type: WAButtonType){
        self.type = type
        super.init(frame: .zero)        
        setupViews()
        constraintViews()
        configureAppereance()
    }

    
    func setTitle(_ title: String?) {
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        constraintViews()
        configureAppereance()
    }

}

private extension WAButton {
    
    func setupViews(){
        addViewWithoutTAMIC(label)
        addViewWithoutTAMIC(iconView)

    }
    
    func constraintViews(){
        var horisontalOffset: CGFloat {
            switch type {
            case .primary:
                return 0
            case .secondary:
                return 10
            }
        }
        
        NSLayoutConstraint.activate([
            
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset)
            
        ])
    }
    
    func configureAppereance(){
        switch type {
        case .primary:
            label.textColor = Resources.Color.inactive
            iconView.tintColor = Resources.Color.inactive
            label.font = Resources.Fonts.helvelticaRegular(with: 13)

        case .secondary:
            backgroundColor = Resources.Color.separator
            layer.cornerRadius = 14
            label.textColor = Resources.Color.active
            iconView.tintColor = Resources.Color.active
            label.font = Resources.Fonts.helvelticaRegular(with: 15)

        }
        makeSystem(self)

        label.textAlignment = .center
        iconView.image = Resources.Common.downArrow?.withRenderingMode(.alwaysTemplate)
    }
}
