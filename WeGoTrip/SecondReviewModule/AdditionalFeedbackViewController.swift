//
//  AdditionalFeedbackViewController.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 12.05.2022.
//

import UIKit

final class AdditionalFeedbackViewController: UIViewController {

    private let imageView = UIImageView()
    private let firstQuestionLabel = UILabel()
    private let whatsLikeTextView = UITextView()
    private let secondQuestionLabel = UILabel()
    private let whatWillBeBetterTextView = UITextView()
    private let saveButton = UIButton(type: .system)
    private let skipButton = UIButton(type: .system)
    
    
    var presenter: AdditionalFeedbackPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupImageView()
        initializeView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.layer.cornerRadius = 0.5 * imageView.bounds.size.height
        imageView.clipsToBounds = true

    }
    
    private func setupImageView() {
        let url = ApiConstants.imageURL
        NetworkService.shared.fetchImage(at: url, completion: { img in
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = img
            }
        })
    }
}


//MARK: - InitializableViewProtocol Interface


extension AdditionalFeedbackViewController: InitializableViewProtocol {
    
        func initializeView() {
        addViews()
        configureLayout()
        bindViews()
        configureAppearance()
        localize()
    }
    
    func addViews() {
        
        view.addSubview(imageView)
        view.addSubview(firstQuestionLabel)
        view.addSubview(whatsLikeTextView)
        view.addSubview(secondQuestionLabel)
        view.addSubview(whatWillBeBetterTextView)
        view.addSubview(saveButton)
        view.addSubview(skipButton)
    }
    
    func configureLayout() {
        
        imageView.snp.makeConstraints {
            $0.leading.equalTo(25)
            $0.top.equalTo(25)
            $0.width.equalTo(75)
            $0.height.equalTo(75)
            
        }
        
        firstQuestionLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        whatsLikeTextView.snp.makeConstraints {
            $0.top.equalTo(firstQuestionLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(120)
        }
        
        secondQuestionLabel.snp.makeConstraints {
            $0.top.equalTo(whatsLikeTextView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        whatWillBeBetterTextView.snp.makeConstraints {
            $0.top.equalTo(secondQuestionLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(120)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(90)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(50)
        }
        
        skipButton.snp.makeConstraints {
            $0.top.equalTo(saveButton).offset(70)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
    }
    
    func bindViews() {
        addTarget(self, saveButtonPressedAction: #selector(didPressSaveButton))
        addTarget(self, skipButtonPressedAction: #selector(didPressSkipButton))
    }
    
    @objc private func didPressSkipButton() {
        self.presenter?.didPressSkipButton()
    }
    
    @objc private func didPressSaveButton() {
        self.presenter?.didPressSaveButton(whatsLikeTextView: whatsLikeTextView.text,
                                           whatWillBeBetterTextView: whatWillBeBetterTextView.text)
        
    }
    
    
    func configureAppearance() {
        
        endEditingWhenTapped()
        imageView.contentMode = .scaleAspectFill
        firstQuestionLabel.numberOfLines = 0
        firstQuestionLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        secondQuestionLabel.numberOfLines = 0
        secondQuestionLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        whatsLikeTextView.delegate = self
        whatsLikeTextView.textColor = .lightGray
        whatsLikeTextView.font = UIFont.boldSystemFont(ofSize: 18)
        
        whatWillBeBetterTextView.delegate = self
        whatWillBeBetterTextView.textColor = .lightGray
        whatWillBeBetterTextView.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        saveButton.tintColor = .white
        saveButton.backgroundColor = .systemIndigo
        saveButton.layer.cornerRadius = 12
        
        skipButton.tintColor = .lightGray

    }
    
    func localize() {
        firstQuestionLabel.text = "Что Вам особенно понравились в этом туре?"
        secondQuestionLabel.text = "Как мы могли бы улучшить подачу информации?"
        whatsLikeTextView.text = "Напишите здесь, чем Вам запомнился тур, посоветуете ли его друзьям, удалось ли повеселиться?"
        whatWillBeBetterTextView.text = "Напишите здесь, чем Вам запомнился тур, посоветуете ли его друзьям, удалось ли повеселиться?"
        saveButton.setTitle("Сохранить отзыв", for: .normal)
        skipButton.setTitle("Пропустить", for: .normal)
    }
    
    
    func addTarget(_ target: Any?, saveButtonPressedAction: Selector) {
        saveButton.addTarget(target, action: saveButtonPressedAction, for: .touchUpInside)
    }
    
    func addTarget(_ target: Any?, skipButtonPressedAction: Selector) {
        skipButton.addTarget(target, action: skipButtonPressedAction, for: .touchUpInside)
    }
    
    
}


//MARK: - UITextViewDelegate

extension AdditionalFeedbackViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
        textView.text = ""
        textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
        if textView.text.isEmpty || textView.text == "" {
            textView.textColor = .lightGray
            textView.text = "Напишите здесь, чем Вам запомнился тур, посоветуете ли его друзьям, удалось ли повеселиться?"
        }
    }
}


//MARK: - AdditionalFeedbackViewProtocol Interface


extension AdditionalFeedbackViewController: AdditionalFeedbackViewProtocol {
    
    
    func showDoneAlertMessage() {
        let message = "Ваш отзыв сохранен!"
        showAlert(withMessage: message, actionHandler: nil)
    }
    
    
    func showErrorAlertMessage() {
        let message = "Что-то пошло не так!"
        showAlert(withMessage: message, actionHandler: nil)
    }    
    
    func enableContinueButton() {
        
    }
    
    func disableContinueButton() {
        
    }
    
    func startAnimatingButton() {
        
    }
    
    func stopAnimatingButton() {
        
    }
}
