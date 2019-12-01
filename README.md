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

