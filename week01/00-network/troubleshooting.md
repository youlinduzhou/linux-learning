# 网络故障排查清单
## 使用说明：从第1层开始逐层排查，当前层不通时无需继续后续层。
1. **物理层** → `ip link show`（检查网卡UP状态）
2. **数据链路层** → `ip addr show`（检查IP配置）
3. **网络层** → `ping 网关` / `traceroute`（检查路由）
4. **传输层** → `ss -tlnp`（检查端口监听）
5. **应用层/DNS** → `curl` / `resolvectl status`（检查服务可用性）
