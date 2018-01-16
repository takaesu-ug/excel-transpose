# Excel::Transpose

## Usage

### Requirements

- Docker
- make

### 1. docker build

```
$ make docker_build
```

### 2. docker run

```
$ make docker_run EXCEL=[XLSX_FILENAME]

ex)
$ make docker_run EXCEL=text.xlsx
```

- `XLSX_FILENAME`
    - You can set xlsx filename only. Therefore you should put xlsx file in current directory.

### others

you can use tty on container

```
$ make docker_tty
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
