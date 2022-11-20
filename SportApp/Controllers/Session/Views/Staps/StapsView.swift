//
//  StapsView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 20.11.2022.
//

import UIKit

final class StapsView: WABaseInfoView {
    
    private let barsView = WABarsView()
    
    
    func configure(with items: [WABarView.Data]){
        barsView.configure(with: items)
    }
}

extension StapsView {
    override func setupViews(){
        super.setupViews()
        addViewWithoutTAMIC(barsView)

    }
     override func constraintViews(){
         super.constraintViews()
         
         NSLayoutConstraint.activate([
            
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  15),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -15),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),

         ])
     }
     override func configureAppearance(){
         super.configureAppearance()
         
     }
 }

