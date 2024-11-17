//
//  EncodebleExtension.swift
//  TKTodoApp
//
//  Created by Mohammad  on 17/11/2024.
//

import Foundation


extension Encodable {
    func asdict() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
