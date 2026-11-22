# Lean4Study

Lean 4 与 mathlib 学习项目。

## 版本

- Lean：`v4.36.0`，由 `lean-toolchain` 固定。
- mathlib：`v4.36.0`，由 `lakefile.toml` 指定。
- `lake-manifest.json` 记录依赖的确切提交，应提交到 Git。

## 开始学习

使用 VS Code 打开整个 `Lean4Study` 文件夹，然后打开
`Lean4Study/Basic.lean`。安装推荐的 `leanprover.lean4` 扩展，
可以查看定理证明状态并获得错误提示。

项目中的 `lean4` 是原有的空文件；Lean 源码应使用 `.lean` 扩展名。

在项目根目录的 PowerShell 终端执行：

```powershell
lean --version
lake env lean Lean4Study/Basic.lean
lake build
```

首次安装 elan 后，若终端找不到 `lean` 或 `lake`，请完全退出并重新打开
VS Code 和终端，让新进程读取更新后的 PATH。也可以在当前 PowerShell 中执行：

```powershell
$env:Path = "$env:USERPROFILE\.elan\bin;$env:Path"
```

## 从 GitHub 克隆后恢复依赖

先安装 [elan](https://github.com/leanprover/elan)，然后执行：

```powershell
.\scripts\setup.ps1
```

脚本根据 `lean-toolchain` 安装对应的 Lean，执行 `lake update` 生成或
更新依赖清单，然后执行 `lake exe cache get` 和 `lake build`。
网络故障后也可以重新运行此脚本继续配置。
`.lake/` 下的依赖与构建文件已被 `.gitignore` 排除。

更新 mathlib 时，应同时匹配其 `lean-toolchain`，再运行 `lake update`
和 `lake exe cache get`，并提交更新后的版本配置与依赖清单。
