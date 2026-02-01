// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

@main
struct SRT2Text: ParsableCommand {

	@Argument(help: "Input SRT file", transform: { URL(filePath: $0) })
	var srtInputFile: URL

	@Option(help: "Output txt file", transform: { URL(filePath: $0) })
	var txtOutputFile: URL?

    mutating func run() throws {
        print("Hello, world!")
    }
}
