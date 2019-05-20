# Игровая платформа SuzenEscape

Призвана для обучения в нестандартной форме командам linux.
В готовом и развернутом виде поиграть можно тут: http://escape.myctf.ru

Этот репозиторий предназначен именно для разработки! Если вы совсем-совсем новичок в linux, пробуйте сначала поиграть,
а потом уже заняться разбором платформы и созданию новых заданий.

## Структура

1) **ansible** предназначена для выкатки платформы на некоторый игровой сервер
2) **chain** содержит данные для сборки уровней
3) **suzen_website** содержит веб интерфейс для игры (жюрейная система не является открытым продуктом и не входит в этот репозиторий)

## БЫСТРЫЙ СТАРТ

**Требования к системе**

* Ваша операционная система должна поддерживать 64-разрядные виртуальные машины.
* Теоретически платформу можн поднять на любой ОС, которая поддерживает virtualbox и vagrant, но проверялось только на debian\ubuntu

Порядок действий:

* Установить следующий набор ПО:
  * vagrant (https://www.vagrantup.com/downloads.html)
  * virtualbox (https://www.virtualbox.org/wiki/Linux_Downloads)
  * rsync 
  * ansible
* Выполнить поднятие виртуальной машины
  ```bash
  vagrant up
  ```
* В случае получения ошибки выполнить команду:
  ```bash
  vagrant provision
  ```
* Платформа развернута и готова. Задания доступы через ssh, где XX - номер уровня
  ```bash
  ssh -p 2222 suzenXX@127.0.0.1
  ```
* Доступ к веб интерфейсу:
  ```text
  http://127.0.0.1:8080
  ```

## Сборка

Сборку осуществляет корневой скрипт build.sh, который принимает в качестве аргумента номер собираемого уровня

* Выполнить сборку всех уровней (старый способ):
  ```bash
  for i in $(seq 1 29); do ./build.sh $i; done
  ```
  либо
  ```bash
  ./build.py all
  ```
* Сборка веб-интерфейса:
  ```bash
  docker build -t 127.0.0.1:5000/suzenescape/web . && docker push 127.0.0.1:5000/suzenescape/web
  ```

## Registry и системные контейнеры

В случае если вы хотите разворачивать платформу с использованием стороннего docker registry, укажите его в
ansible/values.yaml в переменной docker_registry.

Также в рамках перехода на единый сборщик, существует еще системный контейнер: bykva/busybinaries,
он собирается в директории busybox-custom. Я разместил его на docker hub для уменьшения количества шагов в быстром старте.

## Используемые переменные

Все переменные проекта собраны в файле ansible/values.yaml

TODO: описание переменных

## Виды задач:

* Задачи с флагом внутри: флаг дается за то что игрок догадался куда смотреть или выполнил набор действий,
  который привел его к флагу.
* Задачи с внешней проверкой: используется cronjob, которые прописываются в ansible\templates.
  (Также нужно прописать в site.yaml). Согласно cron будет выполняться достижение некоторого заданного состояния,
  за который игроку обещан флаг. Состояние и проверка выдумываются автором такого задания.
* Задачи с подключением к стороннему контейнеру. см таски 5 и 9.
