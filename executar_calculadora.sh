#!/bin/bash

# Cabeçalho do projeto 1
echo "==============================="
echo "Executar uma calculadora Python"
echo "==============================="

# Verifica se o python está instalado
if ! command -v python3 &> /dev/null; then
	echo "Python3 não está instalado. Iniciando instalação..."

	# Verefica o gerenciador de pacotes e instala python3
	if command -v apt &> /dev/null; then
		sudo apt update
		sudo apt install -y python3
	elif command -v yum &> /dev/null; then
		sudo yum install -y python3
	elif command -v pacman &> /dev/null; then
		sudo pacman -Sy python3
	else
		echo "Não foi possível detectar o gerenciador de pacotes. Por favor, instale o Python3 manualmente."
		exit 1
	fi

	echo "Python3 instalado com sucesso!"
else
	echo "Python3 já está instalado."
fi

# Criação de um diretório para logs
DIR="calculadora_logs"
if [ ! -d "$DIR" ]; then
	echo "Criando diretório $DIR para armazenar os logs."
	mkdir "$DIR"
fi

# Executa a calculadora e salva os logs
echo "Executando a calculadora..."
python3 calculadora.py | tee "$DIR/$(date +'%Y-%m-%d_%H-%M-%S').log"
