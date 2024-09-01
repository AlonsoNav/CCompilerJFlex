# Compiler Project

This is a college compiler project for the Compiler and Interpreter course at ITCR (Instituto Tecnológico de Costa Rica).

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributors](#contributors)

## Introduction

This project is developed as part of the Compiler and Interpreter course at ITCR. The goal of the project is to build a simple compiler that can lexically analyze, parse, and generate intermediate code for a subset of the C programming language.

This first version just involved the scanner.

## Installation

To build and run the project, you need to have Java installed on your system. Follow these steps to set up the project:

1. Clone the repository:
```sh
    git clone https://github.com/AlonsoNav/CCompilerJFlex.git
    cd your-repo
```

2. Generate the CLexer file:
```sh
    java -jar lib/jflex-full-1.9.1.jar src/scanner/CLexer.flex
```

3. Compile the project:
```sh
   javac -d bin -sourcepath src src/app/Main.java src/scanner/CLexer.java .\src\scanner\Token.java .\src\scanner\TokenType.java 
```

## Usage

To run the compiler with an input file, use the following command:
```sh
java -cp bin app.Main input.c
```

You can also send the output to a .txt with
```sh
java -cp bin app.Main input.c > output.txt
```

## Project Structure

This project is organized as follows:

- **src/**: Contains the source code.
  - **app/**: Contains the main application code.
  - **scanner/**: Contains the lexer and token definitions.
- **bin/**: Contains the compiled bytecode.
- **docs/**: Here you can check more information about the project.
- **input.c**: Example input file for testing the lexer.
- **README.md**: This file, containing information about the project.

## Contributors

- [@ScarloVM](https://github.com/ScarloVM)
- [@Rocket310](https://github.com/Rocket310)
