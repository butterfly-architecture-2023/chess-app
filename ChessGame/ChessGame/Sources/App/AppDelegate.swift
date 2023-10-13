//
//  AppDelegate.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/13.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - delegate method for process lifecycle
    
    /// App이 실행된 직후, 사용자의 화면에 보여지기 직전에 호출
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        return true
    }
    
    // MARK: - delegate method for session lifecycle
    
    /// UI Scene을 만들기 전에 App에게 UISceneConfigruation을 요청
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return .init(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }
    
    /// Scene 종료 때 호출
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}
