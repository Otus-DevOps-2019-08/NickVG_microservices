# NickVG_microservices
NickVG microservices repository

docker inspect <u_container_id>
docker inspect <u_image_id>

doker image - Это заготовка для создания контейнера. Содержит в себе весь набоор данных, который может потребоваться при создании контейнера

docker container - сущность(vm) которая работает используя данные зашитые в контейнер. В себе, видимо, содержит лишь данные необходимы для запуска "VM".


docker run --rm -ti tehbilly/htop
вывод списка процессов контейнера
docker run --rm --pid host -ti tehbilly/htop
вывод списка процессов хоста докера. --pid host

