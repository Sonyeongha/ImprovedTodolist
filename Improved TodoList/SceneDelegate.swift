//
//  SceneDelegate.swift
//  Improved TodoList
//
//  Created by 손영하  on 2023/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // 씬 연결 시 호출되는 함수
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // scene이 UIWindowScene 타입인지 확인
        guard let windowScene = scene as? UIWindowScene else { return }

        // 태스크 화면 생성
        let tasksViewController = TasksViewController()

        // 네비게이션 컨트롤러에 태스크 화면을 추가
        let navigationController = UINavigationController(rootViewController: tasksViewController)

        // 새 창 생성
        let window = UIWindow(windowScene: windowScene)
        
        // 창의 메인 화면으로 네비게이션 컨트롤러 설정
        window.rootViewController = navigationController

        // 창 활성화
        self.window = window
        window.makeKeyAndVisible()
    }

    // 씬 연결이 끊길 때 호출
    func sceneDidDisconnect(_ scene: UIScene) {
        // 필요한 리소스 정리 작업
    }

    // 씬 활성화될 때 호출
    func sceneDidBecomeActive(_ scene: UIScene) {
        // 활성화 시 처리할 작업
    }

    // 씬이 비활성화될 때 호출
    func sceneWillResignActive(_ scene: UIScene) {
        // 전화 등으로 인한 일시 중지 처리
    }

    // 앱이 다시 포그라운드로 올 때 호출
    func sceneWillEnterForeground(_ scene: UIScene) {
        // 앱이 다시 활성화될 때 처리할 작업
    }

    // 앱이 백그라운드로 갈 때 호출
    func sceneDidEnterBackground(_ scene: UIScene) {
        // 백그라운드 전환 시 처리할 작업

        // 데이터 변경 사항 저장
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
