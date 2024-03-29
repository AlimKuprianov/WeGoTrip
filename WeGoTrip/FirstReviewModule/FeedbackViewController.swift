//
//  ReviewViewController.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import UIKit
import SnapKit

final class FeedbackViewController: UIViewController {
    
    
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
    private let activityIndicator = UIActivityIndicatorView(style: .medium)


    var presenter: FeedbackPresenterProtocol?

    let emojiArray = ["😡", "☹️", "😐", "☺️", "😀"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupImageView()
        initializeView()
    }
    
    private func setupImageView() {
        let url = ApiConstants.imageURL
        NetworkService.shared.fetchImage(at: url, completion: { img in
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = img
            }
        })
    }
    
    @objc private func didPressNoAnswerButton() {
        self.presenter?.didPressNoAnswerButton()
    }
    
    @objc private func didPressContinueButton() {
        self.presenter?.didPressContinueButton(withRateSlider: Int(firstRateSlider.value),
                                               withRateGuideSlider: Int(rateGuideSlider.value),
                                               withRateInformationSlider: Int(rateInformationSlider.value),
                                               withRateNavigationSlider: Int(rateNavigationSlider.value))
        
    }
    
    @objc private func didPressSliders(sender: UISlider!) {
        sender.setValue(sender.value.rounded(), animated: true)
        
        switch sender {
        case firstRateSlider:
            firstRateSlider.isContinuous = false
            firstEmojiLabel.text = emojiArray[Int(sender.value.rounded())]
        case rateGuideSlider:
            rateGuideSlider.isContinuous = false
            rateGuideEmoji.text = emojiArray[Int(sender.value.rounded())]
        case rateInformationSlider:
            rateInformationSlider.isContinuous = false
            rateInformationEmoji.text = emojiArray[Int(sender.value.rounded())]
        case rateNavigationSlider:
            rateInformationSlider.isContinuous = false
            rateNavigationEmoji.text = emojiArray[Int(sender.value.rounded())]
            
        default:
            break
        }
    }
    
    func addTarget(_ target: Any?, sliderAction: Selector) {
        let arraysOfSliders = [firstRateSlider, rateGuideSlider, rateInformationSlider, rateNavigationSlider]
        
        for slider in arraysOfSliders {
            slider.addTarget(target, action: sliderAction, for: .valueChanged)
        }
    }
    
    func addTarget(_ target: Any?, continueButtonPressedAction: Selector) {
        continueButton.addTarget(target, action: continueButtonPressedAction, for: .touchUpInside)
    }
    
    func addTarget(_ target: Any?, noAnswerButtonPressedAction: Selector) {
        noAnswerButton.addTarget(target, action: noAnswerButtonPressedAction, for: .touchUpInside)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //imageView.layer.cornerRadius = 0.5 * imageView.bounds.size.height
       // imageView.clipsToBounds = true

    }
    
}



//MARK: - InitializableViewProtocol

extension FeedbackViewController: InitializableViewProtocol {
    
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
        continueButton.addSubview(activityIndicator)
        view.addSubview(noAnswerButton)
    }
    
    func configureLayout() {
        
        imageView.snp.makeConstraints {
            $0.leading.equalTo(25)
            $0.top.equalTo(25)
            $0.width.equalToSuperview().dividedBy(15)
            $0.height.equalToSuperview().dividedBy(15)
            
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        firstRateLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        firstEmojiLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        firstRateSlider.snp.makeConstraints {
            $0.top.equalTo(firstRateLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
                
        
        rateGuideLabel.snp.makeConstraints {
            $0.top.equalTo(firstRateSlider.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        rateGuideEmoji.snp.makeConstraints {
            $0.top.equalTo(rateGuideLabel)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        rateGuideSlider.snp.makeConstraints {
            $0.top.equalTo(rateGuideLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        
        rateInformationLabel.snp.makeConstraints {
            $0.top.equalTo(rateGuideSlider.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        rateInformationEmoji.snp.makeConstraints {
            $0.top.equalTo(rateInformationLabel)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        rateInformationSlider.snp.makeConstraints {
            $0.top.equalTo(rateInformationLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        
        rateNavigationLabel.snp.makeConstraints {
            $0.top.equalTo(rateInformationSlider.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        rateNavigationEmoji.snp.makeConstraints {
            $0.top.equalTo(rateNavigationLabel)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        rateNavigationSlider.snp.makeConstraints {
            $0.top.equalTo(rateNavigationLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        continueButton.snp.makeConstraints {
            $0.top.equalTo(rateNavigationSlider).offset(60)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalToSuperview().dividedBy(15)
        }
        
        activityIndicator.snp.makeConstraints {
            $0.centerX.equalTo(continueButton)
            $0.centerY.equalTo(continueButton)

        }
        
        noAnswerButton.snp.makeConstraints {
            $0.top.equalTo(continueButton).offset(60)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
    }
    
    func bindViews() {
        addTarget(self, sliderAction: #selector(didPressSliders))
        addTarget(self, continueButtonPressedAction: #selector(didPressContinueButton))
        addTarget(self, noAnswerButtonPressedAction: #selector(didPressNoAnswerButton))
    }
    
    func configureAppearance() {
        
        rateGuideSlider.minimumValue = 0
        firstRateSlider.maximumValue = 4
        
        rateGuideSlider.minimumValue = 0
        rateGuideSlider.maximumValue = 4
        
        rateInformationSlider.minimumValue = 0
        rateInformationSlider.maximumValue = 4
        
        rateNavigationSlider.minimumValue = 0
        rateNavigationSlider.maximumValue = 4
        
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
}



//MARK: - FeedbackViewProtocol

extension FeedbackViewController: FeedbackViewProtocol {
    
    func enableContinueButton() {
        continueButton.isEnabled = true
        continueButton.alpha = 1
    }
    
    func disableContinueButton() {
        continueButton.isEnabled = false
        continueButton.alpha = 1
    }
    
    func startAnimatingButton() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopAnimatingButton() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
}
