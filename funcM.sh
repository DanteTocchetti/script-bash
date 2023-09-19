#!/bin/bash 

function show_menu() {
    clear
    echo "Menú de Opciones:"
    echo "1. buscar o agregar palabra"
    echo "2. Listar documento"
    echo "3. Buscar palabra en castellano"
    echo "4. Buscar palabra en ingles"
	echo "5. Salir"
    echo
}



function find_word(){
	echo -n "Ingrese la palabra en inglés : "  ; read eword
	wordFile="palabras.txt"

	if [ -e "$wordFile" ]; then
		if grep  -qi "$eword" "$wordFile" ; then
			cword=$(grep -i "$eword" "$wordFile" | cut -d':' -f2)
			echo "La palabra '$eword' significa '-$cword-'."

		else
			echo -n "Ingrese el significado en castellano :" ; read cword
			resultado="$eword : $cword"
			echo "$resultado" >> "$wordFile"
            echo "La palabra '$eword' significa -'$cword'-."
		fi
	else
		echo "El archivo '$wordFile' no existe."
        touch "$wordFile"
        echo -n "Ingrese el significado en castellano :" ; read cword
        resultado="$eword : $cword"
        echo "$resultado" >> "$wordFile"
        echo "La palabra '$eword' significa -'$cword'-."
	fi
}


function show_list(){

	cat "palabras.txt"
}



function translate_es() {
	echo -n "Ingrese la palabra que desea traducir: ";read palabra
	palabra_codificada=$(echo "$palabra" | sed 's/ /%20/g')
	url="https://translate.google.com/?sl=es&tl=en&text=$palabra_codificada&op=translate"
	xdg-open "$url"
}

function translate_en() {
	echo -n "Ingrese la palabra que desea traducir: ";read palabra
	palabra_codificada=$(echo "$palabra" | sed 's/ /%20/g')
	url="https://translate.google.com/?sl=en&tl=es&text=$palabra_codificada&op=translate"
	xdg-open "$url"
}


