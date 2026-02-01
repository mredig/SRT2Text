import Foundation

public struct SRTEntry {
    public let index: Int
    public let timeRange: String
    public let text: String

    public init(index: Int, timeRange: String, text: String) {
        self.index = index
        self.timeRange = timeRange
        self.text = text
    }
}

public struct SRTParser {
    public init() {}

    /// Parse an SRT file content into entries
    public func parse(_ content: String) throws -> [SRTEntry] {
        var entries: [SRTEntry] = []

        // Split by double newlines to separate entries
        let blocks = content.components(separatedBy: "\n\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        for block in blocks {
            let lines = block.components(separatedBy: .newlines)
                .filter { !$0.isEmpty }

            guard lines.count >= 3 else { continue }

            // First line is the index
            guard let index = Int(lines[0]) else { continue }

            // Second line is the time range
            let timeRange = lines[1]

            // Remaining lines are the text
            let text = lines[2...].joined(separator: "\n")

            entries.append(SRTEntry(index: index, timeRange: timeRange, text: text))
        }

        return entries
    }

    /// Extract just the text from SRT entries
    public func extractText(from entries: [SRTEntry], separator: String = "\n") -> String {
        return entries.map { $0.text }.joined(separator: separator)
    }
}
