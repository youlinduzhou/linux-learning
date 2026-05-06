# Git 使用指南

## Git 配置

```bash
# 全局配置
git config --global user.name "youlinduzhou"
git config --global user.email "yujian011@qq.com"

# 查看配置
git config --global --list
```

## SSH Key 配置

```bash
# 生成 SSH Key
ssh-keygen -t ed25519 -C "yujian011@qq.com"

# 查看公钥（复制到 GitHub）
cat ~/.ssh/id_ed25519.pub

# 测试连接
ssh -T git@github.com
```

## 三级提交流程

### 1. 日常提交（每天）
```bash
cd ~/linux-notes
git add .
git commit -m "week01: Day1 文件系统探索"
git push origin main
```

### 2. 冲刺提交（周六）
```bash
cd ~/linux-notes
git add .
git commit -m "week01: 本周学习完成，冲刺提交"
git push origin main
```

### 3. 紧急提交（随时）
```bash
cd ~/linux-notes
git add .
git commit -m "fix: 修复xxx问题"
git push origin main
```

## 常用 Git 命令

```bash
# 查看状态
git status

# 查看提交历史
git log --oneline

# 查看差异
git diff

# 撤销工作区修改
git checkout -- <file>

# 撤销暂存区
git reset HEAD <file>

# 回退到上一个版本
git reset --hard HEAD~1
```
