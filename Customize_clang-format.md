## QtCreator add format style

To add a personalised style to QtCreator go to Tools->Options->Beautifier. Open the "Clang Format" tab, select the "Use customized style" option and click ADD. In the value field paste the following:

    ---
    # We'll use defaults from the WebKit style, but with 4 columns indentation.
    BasedOnStyle: WebKit
    IndentWidth: 4
    ---
    Language: Cpp
    # Force pointers to the type for C++.
    DerivePointerAlignment: false
    PointerAlignment: Left
    ColumnLimit: 120
    ---
    Language: JavaScript
    # Use 100 columns for JS.
    ColumnLimit: 100
    ---
    Language: Proto
    # Don't format .proto files.
    DisableFormat: true
    ...


To see al the possible style configurations executes this command in a terminal:

    clang-format -style=webkit -dump-config




