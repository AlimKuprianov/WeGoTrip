//
//  ReviewViewController.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import UIKit

final class FeedbackViewController: UIViewController,
                                    InitializableViewProtocol {
    
    private let imageView = UIImageView()
    private let mainLabel = UILabel()
    private let firstRateLabel = UILabel()
    private let firstEmojiLabel = UILabel()
    private let firstRateSlider = UISlider()
    
    private let rateGuideLabel = UILabel()
    private let rateGuideEmoji = UILabel()
    private let rateGuideSlider = UISlider()
    
    private let rateInformationLabel = UILabel()
    private let rateInformationEmoji = UILabel()
    private let rateInformationSlider = UISlider()
    
    private let rateNavigationLabel = UILabel()
    private let rateNavigationEmoji = UILabel()
    private let rateNavigationSlider = UISlider()
    
    private let continueButton = UIButton(type: .system)
    private let noAnswerButton = UIButton(type: .system)


    
    let emojiArray = ["😡", "☹️", "😐", "☺️", "😀"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        initializeView()
    }
    
    func initializeView() {
 
        addViews()
        configureLayout()
        bindViews()
        configureAppearance()
        localize()
    }
    
    func addViews() {
        view.addSubview(imageView)
        view.addSubview(mainLabel)
        view.addSubview(firstRateLabel)
        view.addSubview(firstEmojiLabel)
        view.addSubview(firstRateSlider)
        
        view.addSubview(rateGuideLabel)
        view.addSubview(rateGuideEmoji)
        view.addSubview(rateGuideSlider)
        view.addSubview(rateInformationLabel)
        view.addSubview(rateInformationEmoji)
        view.addSubview(rateInformationSlider)
        view.addSubview(rateNavigationLabel)
        view.addSubview(rateNavigationEmoji)
        view.addSubview(rateNavigationSlider)
        
        view.addSubview(continueButton)
        view.addSubview(noAnswerButton)
    }
    
    func configureLayout() {
        
        imageView.snp.makeConstraints {
            $0.leading.equalTo(25)
            $0.top.equalTo(25)
            $0.width.equalTo(75)
            $0.height.equalTo(75)
            
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        firstRateLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        firstEmojiLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        firstRateSlider.snp.makeConstraints {
            $0.top.equalTo(firstRateLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        
        
        
        rateGuideLabel.snp.makeConstraints {
            $0.top.equalTo(firstRateSlider.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        rateGuideEmoji.snp.makeConstraints {
            $0.top.equalTo(rateGuideLabel)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        rateGuideSlider.snp.makeConstraints {
            $0.top.equalTo(rateGuideLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        
        
        
        rateInformationLabel.snp.makeConstraints {
            $0.top.equalTo(rateGuideSlider.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        rateInformationEmoji.snp.makeConstraints {
            $0.top.equalTo(rateInformationLabel)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        rateInformationSlider.snp.makeConstraints {
            $0.top.equalTo(rateInformationLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        
        
        
        rateNavigationLabel.snp.makeConstraints {
            $0.top.equalTo(rateInformationSlider.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        rateNavigationEmoji.snp.makeConstraints {
            $0.top.equalTo(rateNavigationLabel)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        rateNavigationSlider.snp.makeConstraints {
            $0.top.equalTo(rateNavigationLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        continueButton.snp.makeConstraints {
            $0.top.equalTo(rateNavigationSlider).offset(60)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalToSuperview().dividedBy(15)
        }
        
        noAnswerButton.snp.makeConstraints {
            $0.top.equalTo(continueButton).offset(70)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
    }
    
    func bindViews() {
        
    }
    
    func configureAppearance() {
        imageView.image = #imageLiteral(resourceName: "photo_2022-05-10 01.04.03")
        imageView.contentMode = .scaleAspectFill
        mainLabel.numberOfLines = 0
        mainLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        continueButton.tintColor = .white
        continueButton.backgroundColor = .systemIndigo
        continueButton.layer.cornerRadius = 12
        
        noAnswerButton.tintColor = .lightGray
    }
    
    func localize() {
        mainLabel.text = "Офигенно, Вы дошли до конца! Расскажите, как Вам?"
        firstRateLabel.text = "Как Вам тур в целом?"
        rateGuideLabel.text = "Понравился гид?"
        rateInformationLabel.text = "Как Вам подача информации?"
        rateNavigationLabel.text = "Удобная навигация между шагами?"
        continueButton.setTitle("Далее", for: .normal)
        noAnswerButton.setTitle("Не хочу отвечать", for: .normal)
        firstEmojiLabel.text = "😐"
        rateGuideEmoji.text = "😐"
        rateInformationEmoji.text = "😐"
        rateNavigationEmoji.text = "😐"
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.layer.cornerRadius = 0.5 * imageView.bounds.size.height
        imageView.clipsToBounds = true

    }
    
}
