//
//  main.swift
//  ReflectionSystem
//
//  Created by 신승재 on 1/29/25.
//

import Foundation

let container = DIContainer.shared
container.register(type: Repository.self, component: InMemoryRepositoryImpl())
container.register(
  type: UseCase.self,
  component: UseCaseImpl(
    repository: container.resolve(type: Repository.self)
  )
)

let consoleView = ConsoleView(useCase: container.resolve(type: UseCase.self))

consoleView.start()
