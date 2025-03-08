//
//  TaskBundler.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 08.03.25.
//

import Foundation

enum TaskBundler {
    static func taskGroup<Response: PresentableModel>(
        resourceUrls: [URL],
        fetchingTask: @escaping (URL) async throws -> Response?
    ) async -> [Response] {
        await withTaskGroup(of: Response?.self) { taskGroup in
            resourceUrls.forEach { url in
                taskGroup.addTask {
                    try? await fetchingTask(url)
                }
            }

            var results = [Response]()
            for await value in taskGroup {
                value.map { results.append($0) }
            }

            return results
        }
    }
}
