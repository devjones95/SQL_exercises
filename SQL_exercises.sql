/*1) Utilize o dataset público “thelook_ecommerce”, que está presente no projeto
“bigquery-public-data” para trazer o identificador único dos usuários, o primeiro
nome, email e idade, ordernados pela data de criação do cadastro. */

SELECT distinct
  first_name,
  email,
  age,
  created_at  AS date

FROM `bigquery-public-data.thelook_ecommerce.users`

ORDER BY 
  date


/*2) No mesmo dataset do exercício anterior, extraia os pedidos que tenham status
“Shipped” ou “Processing”. */

SELECT distinct
  order_id,
  status

FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Shipped' or status = 'Processing'


/*3) Considerando o mesmo exercício anterior, traga os pedidos que sejam foram
criados no dia “2022-04-05” e, ao mesmo tempo, tenham status “Cancelled”. */

SELECT distinct
  order_id,
  status,
  created_at 

FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Cancelled' and created_at = '2022-04-05'

ORDER BY
  order_id






