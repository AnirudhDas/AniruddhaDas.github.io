# Code Review

It enforces you to follow a defined Coding Standard. Otherwise it throws warnings.

There are two tools to enforce this:

1. **Tailor**
2. **SwiftLint**

## Tailor Install and Usage Guide

#### Installation

```
brew install tailor
```

or

```
curl -fsSL https://tailor.sh/install.sh | sh
```

#### Usage

Run following command to integrate tailor:

```
tailor --xcode /path/to/demo.xcodeproj/
```

## SwiftLint Install and Usage Guide

#### Installation

Using Homebrew:

```
brew install swiftlint
```

or

You can also install SwiftLint by downloading ```SwiftLint.pkg``` from the [latest GitHub release](https://github.com/realm/SwiftLint/releases/latest) and running it.

#### Usage

Just add a new "Run Script Phase" in XCode with:

```
if which swiftlint >/dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint" 
fi
```

#### Ignore some rules

1. Navigate to your project directory in finder.
2. Create a file named `.swiftlint.yml`
3. Put contents as follows.

```
disabled_rules:
  - line_length
  - file_length
excluded:
  - Carthage
  - Pods
```

#### Auto-correct Code

1. Open terminal
2. Navigate to your project directory in terminal.
3. Run following command

```
swiftlint autocorrect
```