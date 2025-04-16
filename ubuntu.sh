#!/data/data/com.termux/files/usr/bin/bash

clear

# Colors
y="\e[1;33m"
r="\e[1;31m"
b="\e[1;34m"
pink='\033[1;35m'
GREEN='\033[0;32m8'

echo -e "${y}"
echo "  ██████╗██╗   ██╗██████╗ ███████╗██████╗ "
echo " ██╔════╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗"
echo " ██║      ╚████╔╝ ██████╔╝█████╗  ██████╔╝"
echo " ██║       ╚██╔╝  ██╔══██╗██╔══╝  ██╔══██╗"
echo " ╚██████╗   ██║   ██████╔╝███████╗██║  ██║"
echo "  ╚═════╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═╝"

echo -e "${y}"
echo " ███████╗ ██████╗ █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗ ███████╗"
echo " ██╔════╝██╔════╝██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗██╔════╝"
echo " ███████╗██║     ███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝███████╗"
echo " ╚════██║██║     ██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗╚════██║"
echo " ███████║╚██████╗██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║███████║"
echo " ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝"

echo -e "${GREEN}"
echo " ██╗   ██╗██████╗ ██╗   ██╗███╗   ██╗████████╗██╗   ██╗"
echo " ██║   ██║██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██║   ██║"
echo " ██║   ██║██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║"
echo " ██║   ██║██╔══██╗██║   ██║██║╚██╗██║   ██║   ██║   ██║"
echo " ╚██████╔╝██████╔╝╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝"
echo "  ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝ "

echo "  ██████╗ ███████╗"
echo " ██╔═══██╗██╔════╝"
echo " ██║   ██║███████╗"
echo " ██║   ██║╚════██║"
echo " ╚██████╔╝███████║"
echo "  ╚═════╝ ╚══════╝"

echo -e "${r}                                > DEVALOPER CYBER BLACK LION! <<${NC}"
NC='\033[0m' # No Color

termux-open-url https://chat.whatsapp.com/Cz5cMCMKXpFKCHE2q6yRG3

#!/bin/bash

# Set password
PASSWORD="cyber2002"

# Ask for password
echo -n "Enter password: "
read -s user_input
echo ""

# Check password
if [ "$user_input" == "$PASSWORD" ]; then
    echo "Access granted."
    
    # Place your tool code here
    echo "Running your Termux tool..."
    
    # Example: echo "Hello from your tool!"
    
else
    echo "Access denied. Incorrect password."
    exit 1
fi

echo -e "${GREEN}== Minimal Ubuntu 22.04 Install for Low-End Devices ==${NC}"
echo -e "${GREEN}[*] Updating Termux...${NC}"
pkg update -y && pkg upgrade -y

echo -e "${GREEN}[*] Installing dependencies...${NC}"
pkg install proot-distro -y

echo -e "${GREEN}[*] Installing Ubuntu 22.04...${NC}"
proot-distro install ubuntu

echo -e "${GREEN}[*] Creating setup script inside Ubuntu...${NC}"
PROOT_DIR="$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu"

cat > "$PROOT_DIR/root/minimal-setup.sh" << 'EOF'
#!/bin/bash
apt update && apt upgrade -y

echo "Installing essential tools..."
apt install -y nano wget curl git neofetch

# Optional: Add 512MB swap for better performance
echo "Setting up 512MB swap..."
fallocate -l 512M /swapfile || dd if=/dev/zero of=/swapfile bs=1M count=512
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab

echo "Setup complete! Run 'neofetch' to check your system info."
EOF

chmod +x "$PROOT_DIR/root/minimal-setup.sh"

# Add helper message to bashrc
cat >> "$PROOT_DIR/root/.bashrc" << 'EOF'

if [ -f ~/minimal-setup.sh ]; then
  echo -e "\e[32mTo complete your setup, run: bash ~/minimal-setup.sh\e[0m"
fi
EOF

echo -e "${GREEN}\nUbuntu minimal installation complete!${NC}"
echo -e "${GREEN}To start Ubuntu: ${NC}proot-distro login ubuntu"
echo -e "${GREEN}Inside Ubuntu, run: ${NC}bash ~/minimal-setup.sh"
