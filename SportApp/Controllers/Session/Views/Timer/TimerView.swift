//
//  TimerView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 14.11.2022.
//

import UIKit

final class TimerView: WABaseInfoView {
    
    private let progressView: ProgressView = {
        let view = ProgressView()
        view.drawProgress(with: 0.6)
        return view
    }()
}

extension TimerView {
    override func setupViews(){
        super.setupViews()
        addViewWithoutTAMIC(progressView)
    }
    override func constraintViews(){
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            
        
        ])
        
    }
    override func configureAppereance(){
        super.configureAppereance()
    }
}
