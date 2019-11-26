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
	При ошибках типа:
	nick@nick-VirtualBox:~/repo/NickVG_microservices/src$ sudo eval $(docker-machine env docker-host)
	open /home/nick/.docker/machine/machines/docker-host/config.json: permission denied
	sudo: eval: command not found
	Использовтаь:
	sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
	sudo chmod g+rwx "/home/$USER/.docker" -R

