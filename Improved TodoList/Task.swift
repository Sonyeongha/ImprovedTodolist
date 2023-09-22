//
//  Task.swift
//  Improved TodoList
//
//  Created by 손영하  on 2023/09/22.
//

import Foundation
// "Task"는 할 일 정보를 나타내는 구조체로 Codable 프로토콜을 채택하고 있음
// JSON과 같은 형식으로 인코딩(변환)하거나 디코딩(복원)하는 작업이 가능
// 이러한 특성은 데이터를 로컬 저장소에 저장하거나 API로부터 받아올 때 유용함

struct Task: Codable {
    // 각각의 할 일은 고유한 "id" 값을 가지며, UUID 형식으로 저장
    struct Task: Codable {
        // 할 일의 고유 아이디
        let id: UUID
        // 할 일의 제목
        var title: String
        // 할 일의 세부 설명 (옵셔널: 없을 수도 있음)
        var detail: String?
        
        // 생성자 업데이트: id, title, detail을 인자로 받도록 함
            init(id: UUID, title: String, detail: String?) {
                self.id = id
                self.title = title
                self.detail = detail
            }
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
