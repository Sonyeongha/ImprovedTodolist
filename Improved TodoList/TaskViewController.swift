//
//  ViewController.swift
//  Improved TodoList
//
//  Created by 손영하  on 2023/09/22.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 할 일 목록을 저장하는 배열
    var tasks: [Task] = []
    // 테이블뷰 선언
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // UI 설정
        setupUI()
        // 할 일 목록 불러오기
        loadTasks()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 뷰가 나타날 때마다 할 일 목록 다시 불러오기
        loadTasks()
        // 테이블뷰 새로고침
        tableView.reloadData()
    }

    func setupUI() {
        // 타이틀 설정
        title = "To-Do List"
        
        // 테이블뷰의 델리게이트와 데이터 소스 설정
        tableView.delegate = self
        tableView.dataSource = self
        // 테이블뷰 크기 및 위치 설정
        tableView.frame = self.view.bounds
        // 테이블뷰를 뷰에 추가
        view.addSubview(tableView)
        // 셀 등록
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "taskCell")
        
        // 오른쪽 상단에 추가 버튼 생성
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func addTask() {
        // 새 할 일을 추가하는 화면 생성
        let detailVC = TaskDetailViewController()
        // 작업 완료 시의 동작 정의
        detailVC.completion = { [weak self] task in
            self?.tasks.append(task)
            // 할 일 목록 저장
            DataManager.shared.saveTasks(self?.tasks ?? [])
            // 테이블뷰 새로고침
            self?.tableView.reloadData()
        }
        let navController = UINavigationController(rootViewController: detailVC)
        present(navController, animated: true, completion: nil)
    }

    // 할 일 목록 불러오는 함수
    func loadTasks() {
        tasks = DataManager.shared.loadTasks()
    }

    // MARK: - UITableViewDataSource methods
    // 할 일 목록의 개수를 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // 할 일 제목으로 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title // 'title' 멤버에 접근
        return cell
    }

    // MARK: - UITableViewDelegate methods
    // 행을 편집할 수 있는지 여부 반환
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 행 편집 시 호출 (예: 삭제)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 할 일 목록에서 삭제
            tasks.remove(at: indexPath.row)
            // 변경된 목록 저장
            DataManager.shared.saveTasks(tasks)
            // 테이블뷰에서 해당 행 삭제
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
