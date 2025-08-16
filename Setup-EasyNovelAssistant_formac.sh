#!/bin/bash

# create and activate venv
if [ ! -d "venv-enamac" ]; then
    /Library/Frameworks/Python.framework/Versions/3.11/bin/python3 -m venv venv-enamac
    source venv-enamac/bin/activate
fi
source venv-enamac/bin/activate
export PATH=$(pwd)/venv-enamac/bin:$PATH

# install pip packages
pip install -r ./EasyNovelAssistantProject/EasyNovelAssistant/setup/res/requirements.txt

# download kobold cpp
#mkdir -p ../KoboldCpp
#cd ../KoboldCpp

# download kobold cpp
#mkdir -p ../KoboldCpp
cd ./EasyNovelAssistantProject/KoboldCpp

# Download macOS-compatible koboldcpp binary
# You can create a symlink named koboldcpp-linux-x64-cuda1150 if needed
if [ ! -e "koboldcpp-macos-x64" ]; then
    #curl -LO https://github.com/LostRuins/koboldcpp/releases/latest/download/koboldcpp-macos-x64
    curl -LO https://github.com/LostRuins/koboldcpp/releases/download/v1.97.4/koboldcpp-mac-arm64
    chmod +x koboldcpp-mac-arm64
    # 本家様ソースを改変することなく動くように偽のシンボリックリンクを作ってごまかします
    ln -sf koboldcpp-mac-arm64 koboldcpp-linux-x64-cuda1150
fi

if [ ! -e "Vecteus-v1-IQ4_XS.gguf" ]; then
    curl -LO https://huggingface.co/mmnga/Vecteus-v1-gguf/resolve/main/Vecteus-v1-IQ4_XS.gguf
fi

cd -
