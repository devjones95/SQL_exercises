/*1) Retorne em uma só consulta os valores de média, máximo, mínimo, contagem e
soma do campo “attendance” da tabela “schedules”, dataset “baseball”, mesmo
que a contagem e a soma de torcedores nos estádios não tenham significado
para análise de negócio.*/

select distinct
  min(attendance)   as min_attedance,
  max(attendance)   as max_attedance,   
  count(attendance) as total_attendance,
  sum(attendance)   as attedance,
  round(avg(attendance))    as avg_attendance

from `bigquery-public-data.baseball.schedules`


/*2) No mesmo dataset e tabela do exercício anterior, retornar a quantidade de jogos
disputados por cada time em casa por ano e também a soma de minutos jogados
em casa por ano. Ordenar de forma decrescente pelo ano e depois crescente
pelo nome do time.*/

select distinct
  homeTeamName           as time_casa,
  count(gameId)          as qtd_jogos,
  year                   as ano,
  sum(durationMinutes)   as total_minutos_jogados
from `bigquery-public-data.baseball.games_wide`
group by all
order by
  year desc,
  homeTeamName asc


/*3) No dataset “austin_bikeshare”, descubra qual a quantidade de viagens
realizadas em 2017 com duração de 30 minutos ou mais, somente de estações
(tanto de partida quanto de chegada) que estão atualmente ativas.*/

select
  count(trip_id)  as viagens
from `bigquery-public-data.austin_bikeshare.bikeshare_trips` as t
join `bigquery-public-data.austin_bikeshare.bikeshare_stations`as si on t.start_station_id = si.station_id
join `bigquery-public-data.austin_bikeshare.bikeshare_stations`as sf on t.end_station_id = cast(sf.station_id) as string

where
  extract(year from start_time) = 2017
  and duration_minutes >= 30
  and si.status = 'active'
  and sf.status = 'active'


/*4) No mesmo dataset anterior, calcule a média de duração das viagens por tipo de
cliente (“subscriber_type”) por ano*/

select
  round(avg(duration_minutes) ,1)         as media_duracao_viagens,
  subscriber_type,
  extract(year from start_time) as year
from `bigquery-public-data.austin_bikeshare.bikeshare_trips`
where subscriber_type is not null

group by 2,3

order by year















