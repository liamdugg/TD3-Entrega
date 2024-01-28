
all: dt modinstall srvinstall

cleanall: modrmv srvclean

# driver recipes
modinstall:
	make -C bmp-driver/driver/ build insmod
modrmv:
	make -C bmp-driver/driver/ clean rmmod
modtail:
	make -C bmp-driver/driver/ tail

# device tree recipes
dt:
	make -C bmp-driver/device_tree/ dtb

# server recipes
srvinstall:
	make -C http-server/server/ build run
srvrun: 
	make -C http-server/server/ run
srvbuild:
	make -C http-server/server/ build
srvclean:
	make -C http-server/server/ clean

help:
	clear
	@echo "[0] All"
	@echo "  - all        --> ejecuta dt, modinstall y srvinstall"
	@echo "  - cleanall   --> ejecuta modrmv y srvclean"
	@echo ""

	@echo "[1] Driver"
	@echo "  - modinstall --> buildea e instala el modulo"
	@echo "  - modrmv     --> limpia archivos y remueve el modulo"
	@echo "  - modtail    --> tail para los mensajes del modulo (printk)"
	@echo ""

	@echo "[2] Device Tree"
	@echo "  - dt         --> crea y copia .dtb a /boot/dtbs/4.19.280-bone76/"
	@echo "                   copia uEnv.txt a /boot"
	@echo ""
	
	@echo "[3] Server"
	@echo "  - srvinstall --> compila y corre el servidor"
	@echo "  - srvrun     --> corre el servidor"
	@echo "  - srvbuild   --> compila el servidor"
	@echo "  - srvclean   --> elimina el ejecutable"
	@echo ""