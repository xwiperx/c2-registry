#!/bin/bash
# ═══════════════════════════════════════════════════════════════
#  FarhangSara — New Server Bootstrap
#  این اسکریپت روی هر سرور alwaysdata جدید، یک بار اجرا می‌شه
#  هیچ پارامتر یا تغییری لازم نداره
# ═══════════════════════════════════════════════════════════════
set -e

PUBKEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA2oXYVlnBE/5Pgdy78WfuHZGiWnRFLZCgQCka1eyHbX farhangsara-deploy"

echo ""
echo "════════════════════════════════════════"
echo "  FarhangSara — راه‌اندازی سرور جدید"
echo "════════════════════════════════════════"
echo ""

# ─── ۱. ~/.ssh و pubkey ───
mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [ -f ~/.ssh/authorized_keys ] && grep -qF "$PUBKEY" ~/.ssh/authorized_keys 2>/dev/null; then
    echo "✅ pubkey قبلاً ست بود"
else
    echo "$PUBKEY" >> ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    echo "✅ pubkey به authorized_keys اضافه شد"
fi

# ─── ۲. پوشه وب ───
mkdir -p ~/www/x
echo "✅ پوشه ~/www/x ساخته شد"

# ─── ۳. گزارش ───
HOSTNAME=$(hostname 2>/dev/null || echo "unknown")
USERNAME=$(whoami 2>/dev/null || echo "unknown")
WEBSITE_HOST=$(echo "$HOSTNAME" | sed 's/^ssh-//')

echo ""
echo "════════════════════════════════════════"
echo "✅ سرور آماده‌ست"
echo ""
echo "📌 اطلاعات این سرور:"
echo "   ssh_user : $USERNAME"
echo "   ssh_host : $HOSTNAME"
echo "   ssh_path : /home/$USERNAME/www/x"
echo "   web_url  : https://$WEBSITE_HOST/x"
echo ""
echo "🎯 گام بعدی:"
echo "   ۱. برو به ربات → /panel → 🕷 هسته مرکزی → 🖥 مدیریت سرورها"
echo "   ۲. ➕ افزودن سرور جدید"
echo "   ۳. URL این سرور رو وارد کن: https://$WEBSITE_HOST/x"
echo "   ۴. بعد از افزودن → روی سرور بزن → 🚀 Deploy Bootstrap"
echo "════════════════════════════════════════"
echo ""
