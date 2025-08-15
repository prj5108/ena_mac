# ena_mac
- EasyNovelAssistantをMacで動かすための手順書他

## 方針
- インストール方法は本家と違います
- 本家の中身を書き換えるパッチを提供

## フォルダ・ファイル構成
```
ena_mac/
├── Install-EasyNovelAssistant_formac.sh   # 元リポジトリをclone → パッチ適用
├── Run-EasyNovelAssistant_formac.sh       # Mac専用起動スクリプト
├── patch_menu_shortcut.sh                 # Cmd系ショートカット変更
├── （必要なら）その他パッチファイル
├── EasyNovelAssistant/                    # Install後に本家ファイル群がこのフォルダに展開される
├── log/                                   # log、output、image、movie等の入出力系
└── 
```

## EasyNovelAssistantが使うライブラリやアプリ
- Tkinter　PythonのGUIフレームワーク(必須)
- tkdnd　tkのドラッグ＆ドロップの機能拡張(省略も可能)
- KoboldCpp　AIモデルを動かすcuiアプリ
- Style-Bert-VITS2　音声読み上げ
- ???　画像生成



## インストール
- 任意のフォルダ(例えば~/projects)でgit cloneし、中に入ってInstall-EasyNovelAssistant_formac.shを実行してください
- 本家とは違い、インストールのみで、起動はしません
```
cd ~/projects
git clone https://github.com/prj5108/ena_mac.git
cd ena_mac
Install-EasyNovelAssistant_formac.sh
```

## 起動
- 中に入ってRun-EasyNovelAssistant_formac.shを実行してください
```
cd ~/projects/ena_mac
Run-EasyNovelAssistant_formac.sh
```






