//
//  StatsView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 18.11.2022.
//

import UIKit

final class StatsView: WABaseInfoView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
//        stack.backgroundColor = .red
//        stack.distribution = .fillEqually
        return stack
    }()
    
    func configure(with items: [StatsItem]){
        items.forEach {
            let itemView = StatsItemView()
            itemView.configure(with: $0)
            stackView.addArrangedSubview(itemView)
        }
    }
    
    
//    override func setupViews() {
//        super.setupViews()
//
//        addViewWithoutTAMIC(itemView)
//        itemView.configure(with: StatsItemView.StatsItem(
//            image: Resources.Images.ImagesSession.heartBeatIcon,
//            velue: "136",
//            title: Resources.Strings.Session.heartRate.uppercased()
//        ))
//
//        NSLayoutConstraint.activate([
//            itemView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
//            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  15)
//        ])
//    }
}

extension StatsView {
    override func setupViews(){
        super.setupViews()
        addViewWithoutTAMIC(stackView)

    }
     override func constraintViews(){
         super.constraintViews()
         
         NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),

         ])
     }
     override func configureAppereance(){
         super.configureAppereance()
         
     }
 }
