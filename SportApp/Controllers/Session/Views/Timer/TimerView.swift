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
        label.text = "02:15"
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
    
    
    private let remainingTimeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "12:45"
        label.font = Resources.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resources.Color.textGray
        label.textAlignment = .center
        return label
    }()
    
    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()
    
    private let completedPercentView = PercentView()
    private let remainingPercentView = PercentView()
    private let bottomSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Color.separator
        return view
    }()
    
    private let progressView = ProgressView()
    private var timer = Timer()
    private var timerProgress: CGFloat = 0.0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped
//    var callBack : (()-> Void)?
   
    func configure(with duration: Double, progress: Double){
        print("\(duration)")
        self.timerProgress = duration
//        длительность и прогресс в секундах
        let tempCurrentValue = progress > duration ? duration : progress
        
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        let roundedPercent = Int(round(percent * 100))
        
        elapsedTimeValueLabel.text = getDisplayedString(from: Int(tempCurrentValue))
        remainingTimeValueLabel.text = getDisplayedString(from: Int(duration)-Int(tempCurrentValue))
        completedPercentView.configure(title: "COMPETED", with: roundedPercent)
        remainingPercentView.configure(title: "REMAINING", with: 100 - roundedPercent)
        
        progressView.drawProgress(with: CGFloat(percent))
        
    }
    
    func startTimer(completion: @escaping()-> Void){
// @escaping помечая параметр мы говорим что ,когда фукция зaкончит свое выполнение и выгрузитсчя из памяти completion сохраняет ссылку и будет держать результат этой функции
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                
//                self.callBack?()
                completion()
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
            self.timerProgress -= self.timerDuration * 0.01
            
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
        addViewWithoutTAMIC(timeStackView)
        addViewWithoutTAMIC(bottomStackView)
        
        
        
//        Добавляем обьекты в стек через фор ич замыкание
        [
            elapsedTimeLabel,
            elapsedTimeValueLabel,
            remainingTimeLabel,
            remainingTimeValueLabel
        ].forEach(timeStackView.addArrangedSubview)
        
        [
            completedPercentView,
            bottomSeparator,
            remainingPercentView
        ].forEach(bottomStackView.addArrangedSubview)
  
    }
    override func constraintViews(){
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -40),
            
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant:  35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeparator.widthAnchor.constraint(equalToConstant: 1)
        ])
        
    }
    override func configureAppereance(){
        super.configureAppereance()
    }
}
private extension TimerView {
    func getDisplayedString(from value: Int ) -> String {
        let seconds = value % 60
        let minute = (value / 60) % 60
        let hours = value / 3600
        
        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minuteStr = minute < 10 ? "0\(minute)" : "\(minute)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"

        return hours == 0
        ? [minuteStr, secondsStr].joined(separator: ":")
        : [hoursStr, minuteStr, secondsStr].joined(separator: ":")
    }
}
