# SRT2Text

Swift-based command-line tool for parsing SRT (SubRip) subtitle files and extracting text content.

## Installation

### Homebrew (Recommended)

```bash
# Add the tap
brew tap mredig/personal-tools https://github.com/mredig/homebrew-personal-tools

# Install SRT2Text
brew install srt2text
```

### From Source

Requires Swift 6.2 or later:

```bash
git clone https://github.com/mredig/SRT2Text.git
cd SRT2Text
swift build -c release
cp .build/release/SRT2Text /usr/local/bin/
```

## Usage

```bash
# Output to stdout
SRT2Text input.srt

# Output to file
SRT2Text input.srt --txt-output-file output.txt
```

### Options

- `<srt-input-file>` - Input SRT file (required)
- `--txt-output-file <path>` - Output text file (optional, defaults to stdout)
- `-h, --help` - Show help information

## Features

- Parse SRT subtitle files
- Extract plain text content (removes timestamps and entry numbers)
- Output to stdout or file
- Clean, readable text output
- Static binary builds with no external dependencies

## Example

Given an SRT file `subtitles.srt`:

```srt
1
00:00:01,000 --> 00:00:04,000
Welcome to this video.

2
00:00:04,500 --> 00:00:08,000
This is a subtitle example.
```

Running `SRT2Text subtitles.srt` outputs:

```
Welcome to this video.
This is a subtitle example.
```

## License

MIT
