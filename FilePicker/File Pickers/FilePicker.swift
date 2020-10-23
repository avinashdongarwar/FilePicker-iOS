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

    private var files = [File]()

    init(presentationController: UIViewController, delegate: FilePickerDelegate) {
        super.init()
        self.presentationController = presentationController
        self.delegate = delegate
    }

    public func present() {
        guard let delegate = delegate else { fatalError() }

        if #available(iOS 14.0, *) {
            filepickerController = UIDocumentPickerViewController(forOpeningContentTypes:
                                                                    delegate.supportedFileTypes.map({ $0.utTypeForFile }))
        } else {
            filepickerController = UIDocumentPickerViewController(documentTypes: delegate.supportedFileTypes.map({ $0.documentType }), in: .import)
        }
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
        delegate?.didPickFile(file: file)
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

extension File {
    var mimeType: String? {
        guard let fileType = fileType else { return nil }
        return UTTypeCopyPreferredTagWithClass(fileType as CFString, kUTTagClassMIMEType)?.takeRetainedValue() as String?
    }
}
