//
//  CoreDataManager.swift
//  MemoApp
//
//  Created by 신승재 on 3/9/25.
//

import CoreData
import UIKit

final class CoreDataManager {
  
  static let shared = CoreDataManager()
  private init() {}
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Memo")
    container.loadPersistentStores { storeDescription, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()
  
  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  // MARK: - CREATE (데이터 저장)
  func createMemo(content: String, imageData: Data) {
    let newMemo = Memo(context: context)
    newMemo.id = UUID()
    newMemo.image = imageData
    newMemo.createAt = Date()
    newMemo.content = content
    
    saveContext()
  }
  
  // MARK: - READ (데이터 불러오기)
  func fetchMemos() -> [Memo] {
    let fetchRequest: NSFetchRequest<Memo> = Memo.fetchRequest()
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "createAt", ascending: false)]
    
    do {
      return try context.fetch(fetchRequest)
    } catch {
      print("Failed to fetch memos: \(error.localizedDescription)")
      return []
    }
  }
  
  func updateMemo(id: UUID, content: String, imageData: Data) {
    let fetchRequest: NSFetchRequest<Memo> = Memo.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
    
    do {
      let results = try context.fetch(fetchRequest)
      if let memoToUpdate = results.first {
        memoToUpdate.image = imageData
        memoToUpdate.createAt = Date()
        memoToUpdate.content = content
        saveContext()
      } else {
        print("해당 ID의 메모를 찾을 수 없음")
      }
    } catch {
      print("메모 업데이트 실패: \(error.localizedDescription)")
    }
  }
  
  // MARK: - DELETE (데이터 삭제)
  func deleteMemo(_ memo: Memo) {
    context.delete(memo)
    saveContext()
  }
  
  // MARK: - SAVE CONTEXT (변경 사항 저장)
  private func saveContext() {
    if context.hasChanges {
      do {
        try context.save()
        print("save success")
      } catch {
        print("Failed to save context: \(error.localizedDescription)")
      }
    }
  }
}
