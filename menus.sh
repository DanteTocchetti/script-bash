#!/bin/bash

source funcM.sh
show_menu
while true; do
    show_menu
    read -p "Seleccione una opción (1-5): " opcion
    case $opcion in
        1)
            echo "Seleccionaste BUSCAR PALABRA"
            find_word
            ;;
        2)
            echo "Seleccionaste mostrar el archivo de texto"
            show_list
            ;;
        3)
            echo "Buscar traduccion en castellano"
            translate_es
            ;;
        4)
            echo "Buscar traduccion en ingles"
            translate_en
            ;;
        5)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione una opción válida (1-4)."
            ;;
    esac

    read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
done
