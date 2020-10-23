//
//  FilePickerDelegate.swift
//  FilePicker
//
//  Created by Avinash Dongarwar on 10/20/20.
//

import Foundation

protocol FilePickerDelegate: class {
    func didPickFile(file: File?)
    func didCancelledPicker()
    var canSelectMultiple: Bool { get }
    var sizeLimitInMB: Int { get }
    var supportedFileTypes: [SupportedFileType] { get }
}

extension FilePickerDelegate {
    var canSelectMultiple: Bool {
        return false
    }

    var sizeLimitInMB: Int {
        return 10
    }

    var supportedFileTypes: [SupportedFileType] {
        return SupportedFileType.all
    }
}
