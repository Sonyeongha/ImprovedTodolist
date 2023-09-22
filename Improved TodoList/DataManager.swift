//
//  DataManager.swift
//  Improved TodoList
//
//  Created by 손영하  on 2023/09/22.
//
import Foundation

// 사용자의 할 일 목록을 관리하는 데이터 매니저 클래스
class DataManager {
    
    // DataManager 클래스의 유일한 인스턴스를 생성하여 앱 전체에서 하나의 인스턴스만을 사용하도록 함 (싱글턴 패턴)
    static let shared = DataManager()
    
    // 할 일 목록을 UserDefaults에 저장하거나 불러올 때 사용할 키 값
    private let tasksKey = "tasks"
    
    // 외부에서 DataManager의 새로운 인스턴스를 생성하는 것을 방지하기 위한 private 생성자
    private init() {}

    // UserDefaults에서 할 일 목록을 불러와 반환하는 함수
    func loadTasks() -> [Task] {
        if let savedData = UserDefaults.standard.data(forKey: tasksKey),
           let tasks = try? JSONDecoder().decode([Task].self, from: savedData) {
            return tasks
        }
        return []  // 저장된 데이터가 없으면 빈 목록 반환
    }

    // 단일 할 일을 불러온 후 저장하는 함수
    func saveTask(_ task: Task) {
        var tasks = loadTasks()
        tasks.append(task)
        saveAllTasks(tasks)
    }

    // 여러 할 일들을 한번에 저장하는 함수
    func saveTasks(_ tasks: [Task]) {
        saveAllTasks(tasks)
    }

    // 할 일 목록 전체를 UserDefaults에 저장하는 보조 함수
    private func saveAllTasks(_ tasks: [Task]) {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.setValue(data, forKey: tasksKey)
        }
    }
}
