//
//  InitializableViewProtocol.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

public protocol InitializableViewProtocol {
    
    /// Основной метод, который должен вызывать другие методы в определенном порядке.
    func initializeView()
    
    /// Метод добавления view к текущему view.
    func addViews()

    /// Конфигурация лейаута для сабвьюшек
    func configureLayout()
    
    /// Метод привязки к данным или действиям пользователя.
    func bindViews()

    /// Метод конфигурации view
    func configureAppearance()

    /// Метод для локализации
    func localize()

}
