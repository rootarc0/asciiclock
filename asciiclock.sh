#!/bin/bash

# Функция для отображения цифр в ASCII-арте (стиль 1)
print_digit_style1() {
    case $1 in
        0) echo -e "  ___  \n / _ \\ \n| | | |\n| |_| |\n \\___/ " ;;
        1) echo -e "   _   \n  | |  \n  | |  \n  | |  \n  |_|  " ;;
        2) echo -e "  ___  \n |_ _| \n  | |  \n  | |  \n |___| " ;;
        3) echo -e "  ___  \n |_ _| \n  _| | \n |_ _| " ;;
        4) echo -e "   _   \n  | |  \n  |_|  \n    |  \n    |  " ;;
        5) echo -e "  ___  \n |_ _| \n  _| | \n |_ _| " ;;
        6) echo -e "  ___  \n |_ _| \n| | | |\n|_|_|_|" ;;
        7) echo -e "  ___  \n    |  \n    |  \n    |  \n    |  " ;;
        8) echo -e "  ___  \n |_ _| \n|_|_|_|\n|_|_|_|" ;;
        9) echo -e "  ___  \n |_ _| \n  _| | \n |_ _| " ;;
        *) echo -e "       \n       \n       \n       \n       " ;; # Пустое место для недопустимых символов
    esac
}

# Функция для отображения цифр в ASCII-арте (стиль 2)
print_digit_style2() {
    case $1 in
        0) echo -e "  ____  \n / __ \\ \n| |  | |\n| |__| |\n \\____/ " ;;
        1) echo -e "   __   \n  |  |  \n  |  |  \n  |  |  \n  |__|  " ;;
        2) echo -e "  ____  \n | ___| \n |___ \\ \n  ___) |\n |____/ " ;;
        3) echo -e "  ____  \n | ___| \n |___ \\ \n  ___) |\n |____| " ;;
        4) echo -e "   __   \n  |  |  \n  |__|  \n     |  \n     |  " ;;
        5) echo -e "  ____  \n | ___| \n |___ \\ \n  ___) |\n |____| " ;;
        6) echo -e "  ____  \n | ___| \n |___ \\ \n |___) |\n |____/ " ;;
        7) echo -e "  ____  \n     |  \n     |  \n     |  \n     |  " ;;
        8) echo -e "  ____  \n |  _  | \n | |_| |\n |  _  |\n |_| |_|" ;;
        9) echo -e "  ____  \n |  _  | \n | |_| |\n |  _  |\n |_| |_|" ;;
        *) echo -e "       \n       \n       \n       \n       " ;; # Пустое место для недопустимых символов
    esac
}

# Запрос выбора стиля
echo "Choose an ASCII art style (1 or 2):"
read -r style

# Основной цикл
while true; do
    clear
    # Получаем текущее время
    current_time=$(date +"%H%M")
    
    # Создаем массив для строк ASCII-арта
    lines=("", "", "", "", "")
    
    # Разбиваем время на отдельные цифры
           for (( i=0; i<${#current_time}; i++ )); do
           digit=${current_time:$i:1}
           # Получаем ASCII-арт для цифры в зависимости от выбранного стиля
           if [ "$style" -eq 1 ]; then
               ascii_art=$(print_digit_style1 $digit)
           elif [ "$style" -eq 2 ]; then
               ascii_art=$(print_digit_style2 $digit)
           else
               echo "EN: Wrong style. Please select 1 or 2"
               exit 1
           fi
           # Разбиваем ASCII-арт на строки
           IFS=$'\n' read -r -d '' -a art_lines <<< "$ascii_art"
           # Добавляем строки к массиву
           for j in {0..4}; do
               lines[j]+="${art_lines[j]}  "  # Добавляем пробел между цифрами
           done
       done
       
       # Выводим результат с выравниванием
       for line in "${lines[@]}"; do
           printf "%-20s\n" "$line"  # Устанавливаем фиксированную ширину
       done
       
       sleep 1
   done


