//
//  File.swift
//  FilePicker
//
//  Created by Avinash Dongarwar on 10/20/20.
//

import UIKit

class File: UIDocument {

    var data: Data?

    override init(fileURL url: URL) {

        super.init(fileURL: url)
        do {
            self.data = try Data(contentsOf: url)
        } catch {
            print(error.localizedDescription)
        }
    }

    override func contents(forType typeName: String) throws -> Any {
        guard let data = data else { return Data() }
        return try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: true)
    }

    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        guard let data = contents as? Data else { return }
        self.data = data
    }
}
