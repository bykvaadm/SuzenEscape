# Игровая платформа SuzenEscape

Призвана для обучения в нестандартной форме командам linux.
В готовом и развернутом виде поиграть можно тут: http://escape.myctf.ru

Этот репозиторий предназначени именно для разработки! Если вы совсем-совсем новичок в linux, пробуйте сначала поиграть,
а потом уже заняться разбором платформы и созданию новых заданий.

## Структура

1) папка ansible предназначена для выкатки платформы на некоторый игровой сервер
2) все остальное сделано для сборки уровня

## БЫСТРЫЙ СТАРТ

* Установить следующий набор ПО:
  * vagrant (https://www.vagrantup.com/downloads.html)
  * virtualbox (https://www.virtualbox.org/wiki/Linux_Downloads)
  * ansible (https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
* Выполнить поднятие виртуальной машины (вылезут ошибки)
  ```bash
  vagrant up
  ```
* Выполнить сборку всех уровней:
  ```bash
  for i in $(seq 1 29); do ./build.sh $i; done
  ```
* Выполнить установку уровней в виртуальную машину
  ```bash
  vagrant provision
  ```
* Платформа развернута и готова. Задания доступы через ssh, где XX - номер уровня
  ```bash
  ssh -p 2222 suzenXX@127.0.0.1
  ```

## Сборка

Сборку осуществляет корневой скрипт build.sh, который принимает в качестве аргумента номер собираемого уровня

## Registry и системные контейнеры

В случае если вы хотите разворачивать платформу с использованием стороннего docker registry, укажите его в
ansible/values.yaml в переменной docker_registry.

Также в рамках перехода на единый сборщик, существует еще системный контейнер: bykva/busybinaries,
он собирается в директории busybox-custom. Я разместил его на docker hub для уменьшения количества шагов в быстром старте.

## Виды задач:

* Задачи с флагом внутри: флаг дается за то что игрок догадался куда смотреть или выполнил набор действий,
  который привел его к флагу.
* Задачи с внешней проверкой: используется cronjob, которые прописываются в ansible\templates.
  (Также нужно прописать в site.yaml). Согласно cron будет выполняться достижение некоторого заданного состояния,
  за который игроку обещан флаг. Состояние и проверка выдумываются автором такого задания.
* Задачи с подключением к стороннему контейнеру. см таски 5 и 9.