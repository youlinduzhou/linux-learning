#!/bin/bash
# ============================================================
# Day1 常用命令速查脚本 — 文件系统探索
# ============================================================
# 使用方法：source commands.sh 或 ./commands.sh
# 注意：本脚本仅用于学习和复习，不建议在生产环境直接执行
# ============================================================

set -e  # 遇到错误立即退出

echo "=========================================="
echo "  Day1: Linux文件系统探索 — 命令速查表"
echo "=========================================="
echo ""

# ---- 1. 基础导航命令 ----
echo "=== 1. 基础导航命令 ==="
echo "# 查看当前工作目录"
pwd

echo ""
echo "# 列出当前目录内容（基础版）"
ls

echo ""
echo "# 列出所有文件（含隐藏文件+详细信息）"
ls -la

# ---- 2. 目录切换与特殊路径 ----
echo ""
echo "=== 2. 目录切换与特殊路径 ==="
echo "# 进入用户家目录"
cd ~
pwd

echo ""
echo "# 进入上一级目录"
cd ..
pwd

echo ""
echo "# 返回上一个工作目录（需要先cd过其他地方）"
cd -
# pwd 会显示返回到的目录

# ---- 3. 文件类型查看 ----
echo ""
echo "=== 3. 文件类型查看 ==="
echo "# 查看文件类型（ELF可执行文件）"
file /usr/bin/addpart

echo ""
echo "# 查看普通文本文件类型"
file /etc/hostname

# ---- 4. 目录创建操作 ----
echo ""
echo "=== 4. 目录创建操作 ==="
echo "# 创建单层目录"
mkdir test_dir

echo ""
echo "# 递归创建多层嵌套目录（-p参数）"
mkdir -p test_nested/a/b/c

echo ""
echo "# 批量创建多个平行目录（花括号展开）"
mkdir -p {dir1,dir2,dir3}

# ---- 5. 目录结构查看 ----
echo ""
echo "=== 5. 目录结构查看 ==="
echo "# 使用tree查看目录结构（前2层）"
tree -L 2 /etc 2>/dev/null || echo "tree未安装，使用find替代"

echo ""
echo "# 使用find列出所有目录"
find . -type d | head -20

# ---- 6. 核心目录探索 ----
echo ""
echo "=== 6. 核心目录快速访问 ==="
echo "# 系统配置中心"
ls /etc/ | head -10

echo ""
echo "# 经常变化的文件（日志、数据库等）"
ls /var/ | head -10

echo ""
echo "# 用户家目录"
ls /home/

echo ""
echo "# 系统软件资源"
ls /usr/ | head -10

echo ""
echo "# 可执行程序"
ls /bin/ | head -10

echo ""
echo "# 硬件设备"
ls /dev/ | head -10

# ---- 7. 清理测试目录 ----
echo ""
echo "=== 清理测试目录 ==="
rm -rf test_dir test_nested dir1 dir2 dir3
echo "[OK] 测试目录已清理"

echo ""
echo "=========================================="
echo "  命令速查完成！"
echo "=========================================="
echo ""
