//
//  FilePicker.swift
//  FilePicker
//
//  Created by Avinash Dongarwar on 10/21/20.
//

import UIKit
import MobileCoreServices

open class FilePicker: NSObject {
    private var filepickerController: UIDocumentPickerViewController?
    private weak var presentationController: UIViewController?
    private weak var delegate: FilePickerDelegate?

    private var folderURL: URL?
    private var files = [File]()

    init(presentationController: UIViewController, delegate: FilePickerDelegate) {
        super.init()
        self.presentationController = presentationController
        self.delegate = delegate
    }

    public func present(from sourceView: UIView) {
        guard let delegate = delegate else { fatalError() }
        filepickerController = UIDocumentPickerViewController(forOpeningContentTypes:
                                                                delegate.supportedFileType.map({ $0.utTypeForFile }))
        guard let filepickerController = filepickerController else { fatalError() }
        filepickerController.delegate = self
        filepickerController.allowsMultipleSelection = delegate.canSelectMultiple
        presentationController?.present(filepickerController, animated: true)
    }
}

extension FilePicker: UIDocumentPickerDelegate{

    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {

        guard let url = urls.first else {
            return
        }
        let file = documentFromURL(pickedURL: url)
        delegate?.didPickFiles(files: file)
    }

    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        delegate?.didCancelledPicker()
    }

    private func documentFromURL(pickedURL: URL) -> File {
        let shouldStopAccessing = pickedURL.startAccessingSecurityScopedResource()

        defer {
            if shouldStopAccessing {
                pickedURL.stopAccessingSecurityScopedResource()
            }
        }
        return File(fileURL: pickedURL)
    }
}

extension FilePicker: UINavigationControllerDelegate {}

