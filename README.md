# Prerequisiti
- Docker
- Docker Compose
- Java 11
- Maven
# Eseguire Applicazione
1. Scaricare il progetto
```sh
git clone https://github.com/francescodonnini/progetto1.git
```
2. Entrare nella cartella del progetto
```sh
cd progetto1
```
3. Se non si ha a disposizione il file jar si può usare lo script seguente oppure si può effettuare la build dell'applicazione Java a mano. Il progetto Java è disponibilie all'indirizzo: https://github.com/francescodonnini/query.git e si può buildare tramite il comando `mvn package`.
```sh
sh scripts/get-java-app.sh
```
Il file `docker-compose.yml` si aspetta che il jar risultante sia presente nella sotto-directory target.
4. Per eseguire il cluster
```sh
sh scripts/start.sh <number of spark workers> <numbers of datanodes>
```
5. Per eseguire una query
```sh
sh scripts/submit-query-sh --query <query ID> [--appName appName] [--time N]
```
`--appName` fornisce un nome all'applicazione Spark, altrimenti ne viene generato uno in automatico.
`--time` esegue l'applicazione un numero di volte pari a N e ne registra su InfluxDB le tempistiche.