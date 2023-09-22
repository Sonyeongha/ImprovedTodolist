//
//  TaskDetailViewController.swift
//  Improved TodoList
//
//  Created by 손영하  on 2023/09/22.
//

import UIKit

// 할 일의 세부사항을 표시하고 편집하는 뷰 컨트롤러
class TaskDetailViewController: UIViewController {
    
    // 표시하거나 편집할 할 일 객체
    var task: Task?
    // 할 일 저장 후 호출될 클로저
    var completion: ((Task) -> Void)?
    
    // 할 일의 제목을 입력하기 위한 텍스트 필드
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Task Title"  // "할 일 제목"으로 변경 가능
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    // 할 일의 세부사항을 입력하기 위한 텍스트 필드
    private let detailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Task Detail"  // "할 일 세부사항"으로 변경 가능
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // 오른쪽 상단에 "저장" 버튼 추가
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTask))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    // UI 구성을 위한 메서드
    func setupUI() {
        view.backgroundColor = .white
        
        // titleTextField를 뷰에 추가하고 제약 조건 설정
        view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // detailTextField를 뷰에 추가하고 제약 조건 설정
        view.addSubview(detailTextField)
        detailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            detailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // "저장" 버튼을 클릭하면 호출되는 메서드
    @objc func saveTask() {
        // 할 일 제목이 비어있지 않은지 확인
        guard let title = titleTextField.text, !title.isEmpty else {
            // 제목이 비어 있으면 알림 표시
            return
        }
        
        // 할 일 세부사항 가져오기
        let detail = detailTextField.text
        // 새로운 할 일 객체 생성
        let newTask = Task(id: UUID(), title: title, detail: detail)
        
        // 클로저를 통해 새로운 할 일 반환
        completion?(newTask)
        
        // 현재 뷰 컨트롤러를 닫음
        navigationController?.popViewController(animated: true)
    }
}
