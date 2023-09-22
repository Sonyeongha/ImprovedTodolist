//
//  AppDelegate.swift
//  Improved TodoList
//
//  Created by 손영하  on 2023/09/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // 앱이 처음 실행될 때 호출되는 메서드. 앱의 초기 설정을 수행하는 곳
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 앱이 시작될 때 수행해야 할 로직을 여기에 추가할 수 있음. 예를 들면 앱 테마 설정, 서드파티 라이브러리 초기화 등
        return true  // 앱이 정상적으로 시작되었음을 시스템에 알립니다.
    }
    
    // 새로운 씬 세션(다중 화면 지원을 위한 세션)을 생성할 때 호출되는 메서드.
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // UISceneConfiguration을 통해 어떤 씬을 보여줄지 설정. 여기서는 "Default Configuration"을 사용.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    // 앱에서 사용할 Core Data의 저장소를 설정하는 부분.
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Improved_TodoList")
        // "Improved_TodoList"라는 이름의 Core Data 모델 파일을 기반으로 저장소를 초기화.
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                // 저장소를 로딩하는 과정에서 오류가 발생하면 앱을 종료.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container  // 초기화된 저장소를 반환
    }()
    
    // 변경사항이 있을 경우 Core Data에 저장하는 메서드.
    func saveContext() {
        let context = persistentContainer.viewContext  // viewContext는 메인 스레드에서 사용.
        if context.hasChanges {  // 저장소에 변동사항이 있는지 확인.
            do {
                try context.save()  // 변동사항을 저장.
            } catch {
                // 저장하는 과정에서 오류가 발생하면 앱을 종료.
            }
        }
    }
}
