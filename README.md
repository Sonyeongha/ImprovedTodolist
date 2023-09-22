코드를 작성해서 유아이 만들어보기

CRUD 구현해보기

Task 모델 사용하기

Data manager 파일 생성해서 할일 목록을 관리하도록 하기 
싱글턴 패턴:  `static let shared = DataManager()` 코드는 `DataManager`의 유일한 인스턴스를 생성하며, `private init() {}` 코드는 외부에서 새 인스턴스를 생성하는 것을 방지
UserDefaults 사용: 이 클래스는 UserDefaults를 사용하여 할 일 목록을 저장하고 불러옫록 하기 
데이터 불러오기: `loadTasks()` 함수는 UserDefaults에서 할 일 목록을 불러와 반환하고 만약 저장된 데이터가 있으면 그것을 `Task` 배열 형태로 반환하고, 없으면 빈 배열을 반환
데이터 저장하기: 
   - `saveTask(_ task: Task)` 하나의 할 일을 저장하는 함수. 먼저 현재 저장된 할 일들을 불러와 그 목록에 새로운 할 일을 추가한 후, 그 목록을 다시 저장
   - `saveTasks(_ tasks: [Task])` 여러 할 일들을 한번에 저장. 내부적으로 `saveAllTasks(_ tasks: [Task])`를 호출하여 실제 저장
   - `saveAllTasks(_ tasks: [Task])` 할 일 목록 전체를 UserDefaults에 저장하는 보조 함수.`Task` 배열을 JSON 형태로 인코딩하여 UserDefaults에 저장

