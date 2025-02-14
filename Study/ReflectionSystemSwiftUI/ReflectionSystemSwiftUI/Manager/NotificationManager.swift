//
//  NotificationManager.swift
//  ReflectionSystemSwiftUI
//
//  Created by 신승재 on 2/14/25.
//
import UserNotifications
import Foundation

final class NotificationManager {
  
  enum Identifiers {
    static let dailyReflectionReminder = "dailyReflectionReminder"
  }
  
  static let shared = NotificationManager()
  
  func requestPermission() {
    UNUserNotificationCenter.current().requestAuthorization(
      options: [.alert, .sound, .badge]
    ) { granted, error in
      if granted {
        print("알림 권한 허용됨")
      } else {
        print("알림 권한 거부됨")
      }
    }
  }
  
  func checkPermission(completion: @escaping (Bool) -> Void) {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
      DispatchQueue.main.async {
        switch settings.authorizationStatus {
        case .authorized, .provisional:
          completion(true)
        case .denied, .notDetermined:
          completion(false)
        default:
          completion(false)
        }
      }
    }
  }
  
  func setLocalNotification() {
    let content = UNMutableNotificationContent()
    content.title = "오늘의 회고를 작성하세요!"
    content.body = "하루를 돌아보고 간단히 기록해보세요."
    content.sound = .default
    
    var dateComponents = DateComponents()
    dateComponents.hour = 20
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    let request = UNNotificationRequest(
      identifier: Identifiers.dailyReflectionReminder,
      content: content,
      trigger: trigger
    )
    
    UNUserNotificationCenter.current().add(request) { error in
      if let error = error {
        print("알림 예약 실패: \(error)")
      } else {
        print("알림 예약 성공")
      }
    }
  }
  
  func deleteLocalNotification() {
    UNUserNotificationCenter.current().removePendingNotificationRequests(
      withIdentifiers: [Identifiers.dailyReflectionReminder]
    )
  }
}
