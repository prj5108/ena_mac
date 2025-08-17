#!/bin/zsh

# Clone the Style-Bert-VITS2 repository
git clone https://github.com/litagin02/Style-Bert-VITS2.git

# Navigate into the repository directory
cd Style-Bert-VITS2

# git不活性化
mv .git _git

# Create a virtual environment
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Install the required packages
pip install --upgrade pip
pip install -r requirements.txt

# 追加で必要なもの
pip install torch==2.6.0 torchaudio --index-url https://download.pytorch.org/whl/cpu
pip install GPUtil soundfile librosa numpy scipy
pip install "pydantic==1.*"

# いまの venv が有効のままでOK
pip install -q "huggingface_hub[cli]" transformers certifi

# mac でたまに出る SSL 証明書エラー対策
export SSL_CERT_FILE="$(python -m certifi)"

# bert
mkdir -p bert
# 日本語
hf download ku-nlp/deberta-v2-large-japanese-char-wwm --local-dir bert/deberta-v2-large-japanese-char-wwm

# 英語
hf download microsoft/deberta-v3-large --local-dir bert/deberta-v3-large

# 中国語
hf download hfl/chinese-roberta-wwm-ext-large --local-dir bert/chinese-roberta-wwm-ext-large

# Rinne
mkdir -p model_assets/Rinne
hf download RinneAi/Rinne_Style-Bert-VITS2 config.json --local-dir ./model_assets/Rinne
hf download RinneAi/Rinne_Style-Bert-VITS2 Rinne.safetensors --local-dir ./model_assets/Rinne
hf download RinneAi/Rinne_Style-Bert-VITS2 style_vectors.npy --local-dir ./model_assets/Rinne


