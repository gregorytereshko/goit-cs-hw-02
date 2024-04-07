#!/bin/bash

# Визначення списку вебсайтів
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
logfile="website_status.log"

# Очищення файлу логів
> "$logfile"

# Перевірка кожного сайту
for site in "${websites[@]}"
do
    # Використання curl для перевірки доступності сайту
    response=$(curl -s -o /dev/null -w "%{http_code}" "$site")

    # Перевірка статус-коду відповіді
    if [ "$response" -eq 200 ]; then
        echo "$site is UP" | tee -a "$logfile"
    else
        echo "$site is DOWN ($response)" | tee -a "$logfile"
    fi
done

# Вивід інформації про запис у файл логів
echo "Results are recorded in $logfile"
