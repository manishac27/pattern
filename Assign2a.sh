#!/usr/bin/bash

if [ -f "/etc/os-release" ]
then
  source "/etc/os-release" 
  echo "Operating System: $NAME"
  echo "Version: $VERSION"
        if [[ "$NAME" == *"Linux"* ]]
        then
                echo "The OS is $NAME"
                ARCH=$(arch)
                echo "The architecture is $ARCH"
                if [[ "$ARCH" == "ARM64" || "$ARCH" == "x86_64" || "$ARCH" == "ppc64" || "$ARCH" == "ARMv7" || "$ARCH" == "S390x" ]]
                then
                        curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-$ARCH
                        sudo install minikube-linux-$ARCH /usr/local/bin/minikube
                fi
                minikube start
                minikube status
                exitCode=$?
                if [ "$exitCode" != 0 ]
                then
                        echo "minikube installation is failing..........."
        	        exit 1
                else*
                        echo "minikube is installed successfully............"
                fi
        fi
        if [[ "$NAME" == *"macOS"* ]]
        then
        echo "The OS is $NAME"
                ARCH=$(arch)
                echo "The architecture is $ARCH"
                if [[ "$ARCH" == "x86-64" ]]
                then
                        curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
                        sudo install minikube-darwin-amd64 /usr/local/bin/minikube
             	fi
		if [[ "$ARCH" == "ARM64"]]
                then
                        curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64
                        sudo install minikube-darwin-arm64 /usr/local/bin/minikube
             	fi
                minikube start
                minikube statusexitCode=$?
                if [ "$exitCode" != 0 ]
                then
                        echo "minikube installation is failing.............."
            		exit 1
                else
                        echo "minikube is installed Successfully............."
                fi
        fi
        if [[ "$NAME" == *"Windows"* ]]
        then
                echo "The OS is $NAME"
                ARCH=$(arch)
                echo "The architecture is $ARCH"
                if [[  "$ARCH" == "x86_64"  ]]
                then 
                        curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-Windows-$ARCH

                        sudo install minikube-Windows-$ARCH /usr/local/bin/minikube 
                fi
                minikube start
                minikube status
                exitCode=$?
                if [ "$exitCode" != 0 ]
                then
                        echo "minikube installation is failing............."
                        exit 1
                else
                        echo "minikube is installed Successfully............"
                fi
	fi
else
  echo "Unable to determine the operating system."
fi
