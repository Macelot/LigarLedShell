#	Esta funcao ajusta cada porta GPIO para "OUT"
gpio -g mode 17 out
gpio -g mode 18 out
gpio -g mode 27 out
#	Esta e a funcao que reinicia o aplicativo depois das escolhas
loop=y
while test $loop = "y"
do
 clear
#	Elaboracão dos menus:
 tput cup 3 12; echo "Automacao via shell"
 tput cup 5 9; echo "A - Liga led verde"
 tput cup 6 9; echo "S - Desliga led verde"
 tput cup 7 9; echo "D - Liga led branco"
 tput cup 8 9; echo "F - Desliga led branco"
 tput cup 9 9; echo "G - Liga led vermelho"
 tput cup 10 9; echo "H - Desliga led vermelho"

#	Funcão para sair e limpar a tela
 tput cup 27 9; echo "X - Sair: "
 tput cup 27 19; 
 read choice || continue
   case $choice in
#	Funcões que definirao que sera executado 
#	Controles dos Leds
	[Aa]) gpio -g write 17 1 ;;
	[Ss]) gpio -g write 17 0 ;;
        [Dd]) gpio -g write 18 1 ;;
        [Ff]) gpio -g write 18 0 ;;
        [Gg]) gpio -g write 27 1 ;;
        [Hh]) gpio -g write 27 0 ;;
#	Funcão que define como sair do programa
	[Xx]) clear ; exit ;;
     *)tput cup 18 19; echo "Opção inválida"; read choice ;;
 esac
done
