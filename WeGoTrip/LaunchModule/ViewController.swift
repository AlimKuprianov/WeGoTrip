//
//  ViewController.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import UIKit
import SnapKit

final class ViewController: UIViewController,
                            InitializableViewProtocol,
                            ViewProtocol {
    
    
    
    private let launchButton = UIButton(type: .system)
    var presenter: ViewPresenterProtocol?

    
    
    func enableLaunchButton() {
        launchButton.isEnabled = true
        launchButton.alpha = 1
    }
    
    func disableLaunchButton() {
        launchButton.isEnabled = false
        launchButton.alpha = 0.4
    }
    
    func bindViews() {
        addTarget(self, launchButtonPressedAction: #selector(alertShow))
    }
    
    @objc private func alertShow() {
        self.presenter?.didPressLaunchButton()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initializeView()
    }
    
    func initializeView() {
        configureLayout()
        bindViews()
        addViews()
        configureLayout()
        configureAppearance()
        bindViews()
        localize()
        
    }
    
    func addViews() {
        
    }
    
    func configureAppearance() {
        launchButton.setTitleColor(.white, for: .normal)
        launchButton.backgroundColor = .black
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
    }
    
    func localize() {
        launchButton.setTitle("Начать", for: .normal)

    }
    
    func configureLayout() {
        view.addSubview(launchButton)
        launchButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(50)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalToSuperview().dividedBy(15)
        }
    }
    
    override func viewDidLayoutSubviews() {
        launchButton.layer.cornerRadius = 0.3 * launchButton.bounds.size.height
        launchButton.clipsToBounds = true
    }
    
    func addTarget(_ target: Any?, launchButtonPressedAction: Selector) {
        launchButton.addTarget(target, action: launchButtonPressedAction, for: .touchUpInside)
    }


}

