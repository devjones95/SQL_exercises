-- ELEMENTOS DE AGREGAÇAO

-- COUNT = Contabilizar
 select
 count(*) as total_users,
 count(distinct id) as total_ids
 
 from bigquery-public-data.thelook_ecommerce.users

-------------------------------------------------------------------------------------------

select 
  count(distinct status) as qtd_status
from  bigquery-public-data.thelook_ecommerce.orders



-------------------------------------------------------------------------------------------

select --pedidos por dia
  count(distinct order_id) as qtd_pedidos_dia,
  date(created_at)         as dia
  
from  bigquery-public-data.thelook_ecommerce.orders  

group by dia
order by dia


-------------------------------------------------------------------------------------------

select --pedidos por dia usando o extract ao invés de Date
  count(distinct order_id)           as total_pedidos_ano,
  extract(year from created_at)      as ano
  
from  bigquery-public-data.thelook_ecommerce.orders  

group by ano
order by ano

------------------------------------------------------------------------------

-- MAX / MIN
select
  max(retail_price)  as preco_max_prod, -- maior preço de um produto
  min(retail_price)  as preco_min_prod -- menor preço de um produto
from bigquery-public-data.thelook_ecommerce.products



-------------------------------------------------------------------------------------------

select
  max(retail_price)  as preco_max_prod, -- maior preço de um produto
  min(retail_price)  as preco_min_prod, -- menor preço de um produto
  dc.name -- precisamos especificar de onde estamos tirando o campo NAME, já que em ambas as tabelas, temos esse mesmo campo
from bigquery-public-data.thelook_ecommerce.products             as p
join bigquery-public-data.thelook_ecommerce.distribution_centers as dc on p.distribution_center_id = dc.id
/*Aqui demos um join entre a tabela de distribution_center e a products, e ligamos ela pelo id*/

group by
  name


-------------------------------------------------------------------------------------------
-- MIN e MAX com datas

select
  min(created_at) as data_mais_antiga,
  max(created_at) as data_mais_recente
from `bigquery-public-data.thelook_ecommerce.users`

--------------------------------------------------------------------------------------

-- SUM (soma)

select
  round(sum(sale_price) , 2) as receita -- round arredonda pra 2 casas decimais ( o 2 pode ser trocado por qualquer outro número)
from `bigquery-public-data.thelook_ecommerce.order_items`
where status = 'Complete'



-------------------------------------------------------------------------------------------

select  -- se o país foi = Brasil, contabilize como 1 usuário, se não, não conte, e depois some tudo como usuarios_brasil
  sum(if(country = 'Brasil', 1, 0))                as usuarios_brasil, -- exemplo com if
  count(case when country = 'Brasil' then id end) as cadastros_usuarios_brasil -- exemplo com o case when
from `bigquery-public-data.thelook_ecommerce.users`

-------------------------------------------------------------------------------------------------------------------------------





















