# gvw

Golang version manager.

## Installation

```
sudo sh -c "curl -s 
https://raw.githubusercontent.com/kkoudev/gvw/master/install.sh"
```

Please add "/usr/local/bin" to global PATH if not included "/usr/local/bin" in global PATH.

## Uninstallation

```
sudo sh -c "curl -s 
https://raw.githubusercontent.com/kkoudev/gvw/master/uninstall.sh"
```

## Supports ".env" file

The ".env" file defines environment variables during command execution.

```
# 1. Creates a .env file in project root directory.
# .env
GO111MODULE=on

# 2. Executes gvw command or alias go commands.
gvw go mod donwload

or

go mod download
```

## Usage

### Install golang

```
gvw install <version>
```

### Uninstall golang

```
gvw uninstall <version>
```

### List available golang versions

```
gvw list -r
```

### List installed golang versions

```
gvw list -l
```

### Set golang local version

```
gvw local [<version>]
```

This command creates ".go-version" file in current directory.
Show current local version if no specify version.

### Set golang global version

```
gvw global [<version>]
```

This command creates global golang version file.
The global version is used when ".go-version" file not found.
Show current global version if no specify version.

### Set application-specific GOPATH

```
gvw path [<relative path or absolute path>]
```

This command creates ".go-path" file in current directory.
This command supports environment variables.
Show current path if no specify path.

### Print export statements for definition variables from ".env" file.

```
gvw env
```

#### Example

```
# .env file
GO_LINT_URL="golang.org/x/lint/golint"

# specify go get url by definition variable.
eval $(gvw env)
go get ${GO_LINT_URL}
```

### Execute golang commands in current golang version

```
gvw exec <golang command>
```

This command execute golang commands in GOPATH/bin and global PATH.

### Execute go command in current golang version.

```
gvw go
```

There is alias command as "gow".

### Execute gofmt command in current golang version.

```
gvw gofmt
```

There is alias command as "gofmtw".

### Execute godoc command in current golang version.

```
gvw godoc
```

There is alias command as "godocw".

### Show current golang version

```
gvw current
```

This command shows the actually used golang version.

### Show gvw version number

```
gvw version
```

## [Changelog](CHANGELOG.md)

## [License](LICENSE)
