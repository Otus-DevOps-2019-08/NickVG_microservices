# NickVG_microservices
NickVG microservices repository

    docker image - Это заготовка для создания контейнера. Содержит в себе весь набоор данных, который может потребоваться при создании контейнера

    docker container - сущность(vm) которая работает используя данные зашитые в контейнер. В себе, видимо, содержит лишь данные+RW слой необходимые для запуска "VM".

**ДЗ № 12**

    создана ветка docker-2
    cоздал docker host
    создал свой образ NickVG/otus-reddit:1.0
    загрузил свой образ в Docker Hub

**ДЗ №13**
	*Сделано:*
	Развёрнуто приложение состоящие из микросервисов:
	post-py - сервис отвечающий за написание постов
	comment - сервис отвечающий за написание комментариев
	ui - веб-интерфейс, работающий с другими сервисами
	Скачан образ mongoDB
	создана сеть для reddit для работы приложения

	При ошибках типа:
	user@user-VirtualBox:~/repo/microservices/src$ sudo eval $(docker-machine env docker-host)
	open /home/user/.docker/machine/machines/docker-host/config.json: permission denied
	sudo: eval: command not found
	Использовть:
	sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
	sudo chmod g+rwx "/home/$USER/.docker" -R
	Проведена оптимизация Docker файлов

**ДЗ №14**
	При ошибке типа 
	permissions 0670 for '/home/user/.docker/machine/machines/docker-host/id_rsa' are too open
	Выполнить команду
	chmod 400 /home/user/.docker/machine/machines/docker-host/id_rsa

	docker run --network host -d nginx
	Первый раз скачивается докер контейнер и запускается сеть, в следующие разы запускаются сетки.
	docker kill $(docker ps -q)
	Остаётся только одна сеть
	
	docker run -ti --rm --network host joffotron/docker-net-tools -c ifconfig
	vs
	docker-machine ssh docker-host ifconfig
	вывод комманд практически идентичен, за исключением ipv6. Тип выводимых значений отличается.

	*При роблемах с docker-machine:*
	**docker-machine inspect docker-host** 
	и 
	**docker-machine ip docker-host** - для проверки ip. Если ip не совпадают, то:
	**docker-machine start docker-host
	docker-machine start docker-host
	docker-machine env docker-host**
	Базовое имя проекта, по-всей видимсоти,	берётся по имени директории, где находится docker-compose.yml.
	Соответсвенно для именения имени проекта стоит переименовать директорию или же добавить в .env переменную COMPOSE_PROJECT_NAME

**ДЗ №15**

	Развёрнута VM с помощью docker-machine. Доустановлен docker-compose.
	Отработано взаимодействие с gitlab и CI/CD.

**ДЗ №16**"

	пересобраны образы ui, comment, db с помощью скриптов
	docker-образы запушены в докер-хаб
	в сборку добавлен прометеус и настроен мониторинг за приложениями и хостом
	Добален мониторинг аз MongoDB
	В сборку добавлен cloudprober

**ДЗ №17**

	В сборку добавлены cAdvisor
	Разделены docker-compose файлы для приложения и мониторинга
	В сборку добавлена графана и дашборды для неё
	В сборку добавлен alert manager
	Новые образы отправлены в докер-хаб

**ДЗ №18**

	Подняты сервмсы Elasticsearch и Kibana
	Реализовано логгирование докер-контейнеров с помощью Fluentd и отправка их в Elasticsearch
	Рассмотрено использование json-parser
	Рассмотрена работа с неструктурированными логами
	Реализован парсинг логов с использованием регулярных выражений
	Реализована распределённая трассировка с использованием Zipkin
	Причиной медленной работы сломанного кода является это post.db_find_single_post - поиск поста в БД происходит слишком медленно

** ДЗ №19**

	Пройден Kubernetes The Hard Way
	Проверено, что Проверить, что kubectl apply -f <filename> проходит по созданным до этого deployment-ам (ui, post, mongo, comment) и поды (kubectl get pods --all-namespaces) запускаются.

** ДЗ №20**

	Развернуто локальное окружение для работы с Kubernetes
	Развёрнут Kubernetes в GKE
	Reddit запущен в GCP по адресу http://35.226.76.130:31615/
	ну и последнее, слайд 81
	линк
	http://localhost:8001/ui
	гугл его упразднил
	Dashboard is not a built-in application. It is an external UI for kubernetes that might or might not be installed.
	теперь надо заходить через
	http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

	Если вы используете инструментальную панель версии v1.10.1 или новее, вы также должны добавить --enable-skip-login к аргументам командной строки развертывания. Вы можете сделать это, добавив его к args в kubectl edit deployment/kubernetes-dashboard --namespace=kube-system.

	Пример:
      	containers:
      	- args:
          - --auto-generate-certificates
          - --enable-skip-login            # <-- add this line
          image: k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1

