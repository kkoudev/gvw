# 2.0.0 (2021-05-14)

### Added

-   Support for arm64 binary.

### Removed

-   c option of "install" command.
-   gow, gofmtw and godocw command.

# 1.8.5 (2021-01-11)

### Fixed

-   Environment value included comments for .env.

# 1.8.4 (2021-01-08)

### Fixed

-   Environment value included line break for .env.

# 1.8.3 (2020-03-02)

### Fixed

-   Timeout when the binary to download on slow network.

# 1.8.2 (2020-02-17)

### Fixed

-   Incorrect processing with binding PATH value from ".env".

# 1.8.1 (2019-02-11)

### Fixed

-   Binding incorrect values from ".env".

# 1.8.0 (2018-10-24)

### Added

-   Support for ".env" file comments. Add a sharp(#) at the beginning of the line to use comments.

# 1.7.1 (2018-10-17)

### Fixed

-   Optimize "list" command.

# 1.7.0 (2018-10-17)

### Changed

-   gvw work without git command.

# 1.6.3 (2018-10-17)

### Fixed

-   Cannot work "list" command in some linux distribution.

# 1.6.2 (2018-10-16)

### Fixed

-   Cannot work linux.

### Added

-   Checks required commands. Print error message if no required commands.

# 1.6.1 (2018-10-15)

### Added

-   Support for "env" command shells of bash, zsh and fish.

# 1.6.0 (2018-10-15)

### Added

-   Support for "env" command. This command prints export statements for definition variables from ".env" file.

# 1.5.1 (2018-10-15)

### Fixed

-   Cannot output "command not found" error message for "exec" sub command.

# 1.5.0 (2018-09-30)

### Added

-   Creates symbolic links for "go", "gofmt" and "godoc" command at installation.

# 1.4.0 (2018-09-26)

### Added

-   Support for ".env" file. This file defines environment variables during command execution.

# 1.3.0 (2018-09-25)

### Changed

-   "exec" command supports executable file in not exists $GOPATH/bin.

# 1.2.0 (2018-09-20)

### Changed

-   ".gopath" file rename to ".go-path".
-   "path" command supports absolute path and environment variables.

### Fixed

-   Set "$HOME/go" as default path if no set GOPATH.

# 1.1.0 (2018-09-19)

### Added

-   "-c" and "-s" options for "install" command.

# 1.0.0 (2018-08-04)

-   Initial release
