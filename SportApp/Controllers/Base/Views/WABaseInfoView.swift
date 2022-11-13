//
//  WABaseInfoView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 10.11.2022.
//

import UIKit

class WABaseInfoView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resources.Color.inactive
        return label
    }()
    
    private let button = WAButton(with: .primary)
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resources.Color.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    init(with title: String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        button.setTitle(buttonTitle)
        button.isHidden = buttonTitle == nil ? true : false
        super.init(frame: .zero)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonTarget(target: Any?, action: Selector){
//        target may be changes action
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

extension WABaseInfoView {
    override func setupViews() {
        super.setupViews()
        addViewWithoutTAMIC(titleLabel)
        addViewWithoutTAMIC(button)
        addViewWithoutTAMIC(contentView)

    }
    override func constraintViews() {
        super.constraintViews()
        
        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let contentTopOffset:CGFloat = titleLabel.text == nil ? 0 : 10
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
//            button.widthAnchor.constraint(equalToConstant: 130),
            button.heightAnchor.constraint(equalToConstant: 28),
            
            contentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppereance() {
        super.configureAppereance()
        backgroundColor = .clear
    }
}
