#!/bin/bash

if [ $(id -u) -eq 0 ]; then
	echo "------------------"
	echo "Criando grupo adm "
	echo "------------------"
	addgroup adm
	echo "------------------"
	echo "Criando grupo ven "
	echo "------------------"
	addgroup ven
	echo "------------------"
	echo "Criando grupo sec "
	echo "------------------"
	addgroup sec

	echo "------------------------------"
	echo "Adicionando usuario ao sistema"
	echo "------------------------------"
	NomeUsuarioadm=("carlos" "maria" "joao")
	NomeUsuarioven=("debora" "sebastiao" "roberto")
	NomeUsuariosec=("josefina" "amanda" "rogerio")
	echo "------------------------------------------"
	echo "Criando usuarios do grupo da administracao"

	for nome in ${NomeUsuarioadm[*]}; do
		read -s -p "Digite uma senha para o usuario $nome : " senha
		useradd -m -p "$senha" "$nome"
		chmod 770 /home/"$nome"  
		adduser "$nome" adm
		echo ""
	done

	echo "-----------------------------------"
	echo "Criando usuarios do grupo de vendas"

	for nome in ${NomeUsuarioven[*]}; do
		read -s -p "Digite uma senha para o usuario $nome : " senha
		useradd -m -p "$senha" "$nome"
		chmod 770 /home/"$nome"
		adduser "$nome" ven
		echo ""
	done

	echo "--------------------------------------"
	echo "Criando usuarios do grupo da segurança"

	for nome in ${NomeUsuariosec[*]}; do
		read -s -p "Digite uma senha para o usuario $nome : " senha
		useradd -m -p "$senha" "$nome"
		chmod 770 /home/"$nome"
		adduser "$nome" sec
		echo ""
	done
else
	echo "Você precisa estar como root para executar esse script"
	exit 2
fi
