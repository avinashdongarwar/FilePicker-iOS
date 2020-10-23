//
//  UTType+Extensions.swift
//  FilePicker
//
//  Created by Avinash Dongarwar on 10/22/20.
//

import Foundation
import UniformTypeIdentifiers
import MobileCoreServices

enum SupportedFileType: Int {
    case jpg
    case jpg2000
    case gif
    case png
    case tif
    case rtf
    case txt
    case pdf
    case doc
    case docx
    case xls
    case xlsx
    case ppt
    case pptx

    var documentType: String {
        switch self {
        case .jpg:
            return kUTTypeJPEG as String
        case .jpg2000:
            return kUTTypeJPEG2000 as String
        case .gif:
            return kUTTypeGIF as String
        case .png:
            return kUTTypePNG as String
        case .tif:
            return kUTTypeTIFF as String
        case .rtf:
            return kUTTypeRTF as String
        case .txt:
            return kUTTypePlainText as String
        case .pdf:
            return kUTTypePDF as String
        case .doc:
            return "com.microsoft.word.doc"
        case .docx:
            return "org.openxmlformats.wordprocessingml.document"
        case .xls:
            return "com.microsoft.excel.xls"
        case .xlsx:
            return "org.openxmlformats.spreadsheetml.sheet"
        case .ppt:
            return "com.microsoft.powerpoint.​ppt"
        case .pptx:
            return "org.openxmlformats.presentationml.presentation"
        }
    }

    @available(iOS 14.0, *)
    var utTypeForFile: UTType {
        switch self {
        case .jpg:
            return .jpeg
        case .jpg2000:
            return .jpg2000
        case .gif:
            return .gif
        case .png:
            return .png
        case .tif:
            return .tiff
        case .rtf:
            return .rtf
        case .txt:
            return .text
        case .pdf:
            return .pdf
        case .doc:
            return .doc
        case .docx:
            return .docx
        case .xls:
            return .xls
        case .xlsx:
            return .xlsx
        case .ppt:
            return .ppt
        case .pptx:
            return .pptx
        }
    }

    static let all = [jpg, jpg2000, gif, png, tif, rtf, txt, pdf, doc, docx, xls, xlsx, ppt, pptx]
}

@available(iOS 14.0, *)
extension UTType {

    static var jpg2000: UTType {
        UTType.types(tag: "jp2", tagClass: .filenameExtension, conformingTo: nil).first!
    }

    static var doc: UTType {
        UTType.types(tag: "doc", tagClass: .filenameExtension, conformingTo: nil).first!
    }

    static var docx: UTType {
        UTType.types(tag: "docx", tagClass: .filenameExtension, conformingTo: nil).first!
    }

    static var xls: UTType {
        UTType.types(tag: "xls", tagClass: .filenameExtension, conformingTo: nil).first!
    }

    static var xlsx: UTType {
        UTType.types(tag: "xlsx", tagClass: .filenameExtension, conformingTo: nil).first!
    }

    static var ppt: UTType {
        UTType.types(tag: "ppt", tagClass: .filenameExtension, conformingTo: nil).first!
    }

    static var pptx: UTType {
        UTType.types(tag: "pptx", tagClass: .filenameExtension, conformingTo: nil).first!
    }
}
