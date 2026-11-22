# Lean4Study

Lean 4 与 mathlib 学习项目。

## 版本

- Lean：`v4.36.0`，由 `lean-toolchain` 固定。
- mathlib：`v4.36.0`，由 `lakefile.toml` 指定。
- `lake-manifest.json` 记录依赖的确切提交，应提交到 Git。

## 开始学习

本机使用 Windows 上的 VS Code 编辑，在 Ubuntu 24.04（WSL 2）里运行 Lean。
从 Windows PowerShell 打开项目：

```powershell
code --remote wsl+Ubuntu-24.04 /mnt/d/Full_Stack_Study/Lean4Study
```

确认 VS Code 左下角显示 `WSL: Ubuntu-24.04`，打开
`Lean4Study/Basic.lean`，将光标放在 `norm_num` 或 `ring` 上即可查看证明状态。
Lean 扩展应安装在 WSL 端。

项目中的 `lean4` 是原有的空文件；Lean 源码应使用 `.lean` 扩展名。

在该 VS Code 窗口的 Ubuntu 终端执行：

```bash
lean --version
lake env lean Lean4Study/Basic.lean
lake build
```

## 从 GitHub 克隆后恢复依赖

在 WSL 中安装 [elan](https://github.com/leanprover/elan)，然后从项目根目录执行：

```bash
lake exe cache get
lake build
```

elan 根据 `lean-toolchain` 选择 Lean，Lake 按 `lake-manifest.json` 恢复依赖。
`.lake/` 下的依赖与构建文件已被 `.gitignore` 排除。

更新 mathlib 时，应同时匹配其 `lean-toolchain`，再运行 `lake update`
和 `lake exe cache get`，并提交更新后的版本配置与依赖清单。
