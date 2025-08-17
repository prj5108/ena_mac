# ena_mac
- EasyNovelAssistantをMacで動かすための手順書他

## 方針
- インストール方法は本家と違います
- 本家の中身を書き換えるパッチを提供
- 本家をgit cloneする先は"EasyNovelAssistantProject"とする

## フォルダ・ファイル構成
```
ena_mac/
├── Install-EasyNovelAssistant_formac.sh   # 元リポジトリをclone → パッチ適用
├── Run-EasyNovelAssistant_formac.sh       # Mac専用起動スクリプト
├── patch_menu_shortcut.sh                 # Cmd系ショートカット変更
├── （必要なら）その他パッチファイル
├── EasyNovelAssistantProject/             # Install後に本家ファイル群がこのフォルダに展開される
├── log/                                   # log、output、image、movie等の入出力系
└── 
```

## EasyNovelAssistantが使うライブラリやアプリ
- Tkinter　PythonのGUIフレームワーク(必須)
- tkdnd　tkのドラッグ＆ドロップの機能拡張(今回は省略)
- KoboldCpp　AIモデルを動かすcuiアプリ
- Style-Bert-VITS2　音声読み上げ
- ???　画像生成

## Python公式バイナリ3.11.9＋同梱TkでOK、追加ビルドなし
- ドラッグ＆ドロップ操作をあきらめる
- インストール簡単
- tkdndパッチをあてる

## tkdnd のarm64ビルドが必要（Homebrewでtcl-tk入れてコンパイル） TODO
- むずい

## インストール
- 任意のフォルダ(例えば~/projects)でgit cloneし、中に入ってInstall-EasyNovelAssistant_formac.shを実行してください
- 本家とは違い、インストールのみで、起動はしません
```
cd ~/projects
git clone https://github.com/prj5108/ena_mac.git
cd ena_mac
./Install-EasyNovelAssistant_formac.sh
```

## セットアップ
- セットアップは「venv-enamac」という環境を作り、mac用のKoboldCppをダウンロードします
- セットアップ後にkoboldcpp-mac-arm64を起動してみてください
    - koboldcpp-mac-arm64を初めて開く場合は、おそらくOSから拒否されます
    - 「システム設定」の「プライバシーとセキュリティ」を開き、許可を与えてください
```
./Setup-EasyNovelAssistant_formac.sh
```

## 起動
- 中に入ってRun-EasyNovelAssistant_formac.shを実行してください
```
cd ~/projects/ena_mac
./Run-EasyNovelAssistant_formac.sh
```

##　sample,log,movie
- 初回起動後にEasyNovelAssistantProject内にフォルダが作られるので、1階層上にシンボリックリンクを張っておくと便利です
- 起動毎にチェックしてなければリンク作る TODO
```
cd ~/projects/ena_mac
ln -s EasyNovelAssistantProject/sample ./sample
ln -s EasyNovelAssistantProject/log ./log
ln -s EasyNovelAssistantProject/movie ./movie

```

## モデルをDLすると
- EasyNovelAssistantProject/KoboldCpp/LightChatAssistant-TypeB-2x7B_iq4xs_imatrix.gguf　がDLされる
- 切り替えは? TODO
- kobold_cpp.pyあたり

##　本家リポジトリを不活性化するには
```
cd ~/projects/ena_mac/EasyNovelAssistantProject
mv .git _git
```

## ショートカットキーの変更
- 差し替え用ファイルを提供、手動差し替え
- Setupスクリプトで差し替える TODO
- モジュールシャドウ（PYTHONPATHで上書き） TODO
    - 本家に触らず、同じパス構造を shims/ に作って先に読み込ませる。
    - たとえば EasyNovelAssistant/src/menu/gen_menu.py を上書

## Style-Bert-VITS2インストール
- インストーラ Install-Style-Bert-VITS2_formac.sh
- 手動ダウンロード
    - インストーラ中にHuggingFaceからのダウンロードがあります
    - 失敗した場合は、以下から手動で取得してください
        - JP BERT: https://huggingface.co/cl-tohoku/deberta-v2-large-japanese-char-wwm
        - EN BERT: https://huggingface.co/microsoft/deberta-v3-large
        - ZH BERT: https://huggingface.co/hfl/chinese-roberta-wwm-ext-large
        - この3ファイルをmodel_assets/Rinneに保存 https://huggingface.co/RinneAi/Rinne_Style-Bert-VITS2/tree/main/model_assets/Rinne
- 起動 Run-Style-Bert-VITS2_formac.sh
- 処理の書き換え style_bert_vits2.py



