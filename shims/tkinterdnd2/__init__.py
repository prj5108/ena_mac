# shims/tkinterdnd2/__init__.py
# mac用: tkdnd未導入でも落ちないようにするダミー実装

from tkinter import Tk as _Tk, Widget as _Widget, Misc as _Misc

# ENA側が参照する定数だけ用意
DND_FILES = "DND_FILES"

def _noop(*args, **kwargs):
    return None

# ルートウインドウ(Tk)用: DnDメソッドを持つ派生クラスを作る
class _TkDnD(_Tk):
    def drop_target_register(self, *args, **kwargs):
        return None
    def dnd_bind(self, *args, **kwargs):
        return None

# 万が一ウィジェット側でも呼ばれても落ちないようにno-opを生やす
if not hasattr(_Widget, "drop_target_register"):
    _Widget.drop_target_register = _noop
if not hasattr(_Widget, "dnd_bind"):
    _Widget.dnd_bind = _noop
if not hasattr(_Misc, "drop_target_register"):
    _Misc.drop_target_register = _noop
if not hasattr(_Misc, "dnd_bind"):
    _Misc.dnd_bind = _noop

# 本家互換の名前空間を提供
class TkinterDnD:
    Tk = _TkDnD