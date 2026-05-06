#!/bin/bash
# 伪装成浏览器的 curl 测试脚本
# 用途：通过 DevSidecar 代理访问 GitHub，模拟真实浏览器请求头

# 代理地址（根据你的实际设置修改，默认 DevSidecar HTTP 代理端口 8080）
PROXY="http://127.0.0.1:31181"

# GitHub 目标 URL
URL="https://github.com"

# 执行 curl 命令，带上完整的浏览器伪装头
curl -x "$PROXY" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'Cache-Control: max-age=0' \
  -H 'Upgrade-Insecure-Requests: 1' \
  --max-time 30 \
  --connect-timeout 15 \
  -L \
  -v \
  "$URL"
