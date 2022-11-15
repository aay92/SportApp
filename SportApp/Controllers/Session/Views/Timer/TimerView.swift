//
//  TimerView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 14.11.2022.
//

import UIKit

enum TimerState {
    case isRunning
    case isPause
    case isStopped
}

final class TimerView: WABaseInfoView {
    
    private let elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.elapsedTimeLabel
        label.font = Resources.Fonts.helvelticaRegular(with: 14)
        label.textColor = Resources.Color.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 46)
        label.textColor = Resources.Color.textGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.remainengTime
        label.font = Resources.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resources.Color.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let progressView = ProgressView()
    private var timer = Timer()
    private var timerProgress: CGFloat = 0.0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped
   
    func configure(with duration: Double, progress: Double){
        print("\(duration)")
        self.timerProgress = duration
//        длительность и прогресс в секундах
        let tempCurrentValue = progress > duration ? duration : progress
        
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        
        progressView.drawProgress(with: CGFloat(percent))
        
    }
    
    func startTimer(){

        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
      
    }
    
    func pauseTimer(){
        self.timer.invalidate()
    }
    
    func stopTimer(){
        guard self.timerProgress > 0 else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= 0.11
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
                
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
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
