
#!/bin/bash

# Function to detect the operating system

detect_os() {

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then

        echo "linux"

    elif [[ "$OSTYPE" == "darwin"* ]]; then

        echo "darwin"

    elif [[ "$OSTYPE" == "msys"* ]]; then

        echo "windows"

    else

        echo "Unsupported OS"

        exit 1

    fi

}


# Function to download Minikube based on the detected OS

download_minikube() {

    OS="$1"

    if [[ "$OS" == "linux" ]]; then

        # Download Minikube for Linux

        curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

    elif [[ "$OS" == "darwin" ]]; then

        # Download Minikube for macOS

        curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64

    elif [[ "$OS" == "windows" ]]; then

        # Download Minikube for Windows

        curl -Lo minikube.exe https://storage.googleapis.com/minikube/releases/latest/minikube-windows-amd64.exe

    else

        echo "Unsupported OS"

        exit 1

    fi


    chmod +x minikube

}


# Main script

OS=$(detect_os)

echo "Detected OS: $OS"


echo "Downloading Minikube..."

download_minikube "$OS"


echo "Minikube downloaded successfully!"
