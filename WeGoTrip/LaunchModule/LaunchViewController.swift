//
//  ViewController.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import UIKit
import SnapKit

final class LaunchViewController: UIViewController,
                            InitializableViewProtocol,
                            ViewProtocol {
    
    
    //MARK: - Private
    
    private let launchButton = UIButton(type: .system)
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    //MARK: - Presenter
    
    var presenter: LaunchViewPresenterProtocol?

    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        view.addSubview(launchButton)
        launchButton.addSubview(activityIndicator)
        
    }
    
    func configureLayout() {
        launchButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalToSuperview().dividedBy(15)
        }
        activityIndicator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func configureAppearance() {
        launchButton.setTitleColor(.white, for: .normal)
        launchButton.backgroundColor = .black
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        activityIndicator.color = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        activityIndicator.isHidden = true
    }
    
    func localize() {
        launchButton.setTitle("Начать", for: .normal)
        
    }
    
    func bindViews() {
        addTarget(self, launchButtonPressedAction: #selector(didPressLaunchButton))
    }
    
    @objc private func didPressLaunchButton() {
        self.presenter?.didPressLaunchButton()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    

    
    
    func enableLaunchButton() {
        launchButton.isEnabled = true
        launchButton.alpha = 1
    }
    
    func disableLaunchButton() {
        launchButton.isEnabled = false
        launchButton.alpha = 0.4
    }    
    
    override func viewDidLayoutSubviews() {
        launchButton.layer.cornerRadius = 0.3 * launchButton.bounds.size.height
        launchButton.clipsToBounds = true
    }
    
    func addTarget(_ target: Any?, launchButtonPressedAction: Selector) {
        launchButton.addTarget(target, action: launchButtonPressedAction, for: .touchUpInside)
    }


}

