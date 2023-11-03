#!/bin/bash
echo "Installing Fyne IO"
go mod init
go get fyne.io/fyne/v2@2.3.0

touch main.go

cat <<EOF > main.go
package main

import "fyne.io/fyne/v2/app"
import "fyne.io/fyne/v2/container"
import "fyne.io/fyne/v2/widget"

func main() {
    a := app.New()
    w := a.NewWindow("Hello")

    hello := widget.NewLabel("Hello Bash World!")
    w.SetContent(container.NewVBox(
        hello,
        widget.NewButton("Hi! This is could probably the beginning of something big.......", func() {
            hello.SetText("Welcome :)")
        }),
    ))

    w.ShowAndRun()
}
EOF


# Copyright (c) 2023. Gundo Sifhufhi
#
#Pull and Install Go Fyne
echo "Pulling Fyne-Cross"
go install github.com/fyne-io/fyne-cross@latest

#fyne-cross linux --pull
#fyne-cross android --pull
#fyne-cross windows --pull
#fyne-cross macos --pull

echo "Initializing Scripts and installing Fyne"
echo "Testing Lauch"

go mod vendor
go mod tidy
go run main.go

echo "Testing Compilers"
#go fyne-cross linux
#go fyne-cross android
#!/bin/bash

# Create the "Scripts" directory if it doesn't exist
mkdir -p UsedScripts

# Move all .sh files to the "Scripts" directory
mv *.sh UsedScripts/
