#!/bin/bash
GREEN_COLOR='\e[1;32m'
RES='\e[0m'
chattr -i -R /opt/alist >/dev/null 2>&1
mkdir -p /opt/alist
# 安装 Alist 程序
echo -e "\r\n${GREEN_COLOR}安装 Alist ...${RES}"
tar zxf $1/tools/alist-linux-musl-amd64.tar.gz -C /opt/alist/
mv /opt/alist/alist-linux-musl-amd64 /opt/alist/alist
rm -f /opt/alist/alist.db
# 创建 systemd
cat >/etc/systemd/system/alist.service <<EOF
[Unit]
Description=Alist service
Wants=network.target
After=network.target network.service

[Service]
Type=simple
WorkingDirectory=/opt/alist
ExecStart=/opt/alist/alist
KillMode=process

[Install]
WantedBy=multi-user.target
EOF

# 添加开机启动
systemctl daemon-reload
systemctl enable alist >/dev/null 2>&1
systemctl restart alist
echo "Alist 安装成功！"
echo
echo -e "查看状态：${GREEN_COLOR}systemctl status alist${RES}"
echo -e "启动服务：${GREEN_COLOR}systemctl start alist${RES}"
echo -e "重启服务：${GREEN_COLOR}systemctl restart alist${RES}"
echo -e "停止服务：${GREEN_COLOR}systemctl stop alist${RES}"
echo -e "\r\n温馨提示：如果端口无法正常访问，请检查 \033[36m服务器安全组、本机防火墙、Alist状态\033[0m"
echo
