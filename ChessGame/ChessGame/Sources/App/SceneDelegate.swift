//
//  SceneDelegate.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/13.
//

import UIKit


final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - property
    
    // INTERNAL
    var window: UIWindow?
    
    // MARK: - delegate method for UI lifecycle
    
    /// scene이 처음 생성되어 앱에 연결되는 시점에 호출되어 초기 설정을 수행합니다.
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let viewController = BoardVC()
        // viewController.view.backgroundColor = .yellow
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    /// scene이 앱과의 연결이 끊어질 때 호출되어 씬과 관련된 리소스를 해제하는 데 사용됩니다.
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    /// scene이 Active 상태가 되어 사용자와 상호 작용이 가능해질 때 호출되어 화면 업데이트를 수행합니다.
    func sceneDidBecomeActive(_ scene: UIScene) { }
    
    /// `active` -> `inactive`
    func sceneWillResignActive(_ scene: UIScene) { }
    
    /// `background` -> `foreground`
    func sceneWillEnterForeground(_ scene: UIScene) { }
    
    /// `foreground` -> `background`
    func sceneDidEnterBackground(_ scene: UIScene) { }
}
