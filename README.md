# README


* Развернуть проект: docker-compose -f docker-compose.yml up -d 
* Проверить что бд создалась: docker exec -it patient_management-postgresql-1 psql -U postgres -d patient_management_development
* Запустить сервер: docker run -p 3000:3000 -e RAILS_ENV=development patient_management-apр
