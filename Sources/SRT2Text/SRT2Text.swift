// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation
import SRT2TextLib

@main
struct SRT2Text: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Parse SRT subtitle files and extract text content"
    )

    @Argument(help: "Input SRT file", transform: { URL(filePath: $0) })
    var srtInputFile: URL

	@Option(name: [.customShort("o"), .customLong("out")], help: "Output txt file", transform: { URL(filePath: $0) })
    var txtOutputFile: URL?

    mutating func run() throws {
        // Read the SRT file
        let content = try String(contentsOf: srtInputFile, encoding: .utf8)

        // Parse the SRT content
        let parser = SRTParser()
        let entries = try parser.parse(content)

        // Extract text
        let text = parser.extractText(from: entries)

        // Output to file or stdout
        if let outputFile = txtOutputFile {
            try text.write(to: outputFile, atomically: true, encoding: .utf8)
            print("Text extracted to: \(outputFile.path)")
        } else {
            print(text)
        }
    }
}
