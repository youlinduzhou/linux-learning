#!/bin/bash
# auto-tutor 前置依赖检查脚本（最终健壮版）

echo "====== auto-tutor 前置依赖检查 ======"

# 1. Git
echo -n "Git: "
git --version 2>/dev/null || echo "未安装"

# 2. Node.js
echo -n "Node.js: "
node --version 2>/dev/null || echo "未安装"

# 3. npm
echo -n "npm: "
npm --version 2>/dev/null || echo "未安装"

# 4. Python
echo -n "Python: "
python3 --version 2>/dev/null || echo "未安装"

# 5. curl 工具本身
echo -n "curl: "
curl --version 2>/dev/null | head -1 || echo "未安装"

# 6. GitHub 连通性测试（静默，10秒超时）
echo -n "GitHub连通性: "
status=$(curl -s -L --max-time 10 --connect-timeout 5 -w "%{http_code}" -o /dev/null https://github.com 2>/dev/null)
case "$status" in
    200|301|302) echo "$status (可达)" ;;
    *) echo "$status (不通或超时)" ;;
esac

# 7. DeepSeek API 连通性测试（不需 API Key，5秒超时）
echo -n "DeepSeek API连通性: "
ds_status=$(curl -s --max-time 5 --connect-timeout 3 -w "%{http_code}" -o /dev/null https://api.deepseek.com/v1/models 2>/dev/null)
if [ "$ds_status" = "401" ] || [ "$ds_status" = "200" ]; then
    echo "$ds_status (网络可达)"
else
    echo "$ds_status (不通)"
fi

echo "====== 检查完成 ======"

