#1. Quais são os 10 filmes mais apreciados pelo público?
select filme, nota_audiencia
from filmes
order by nota_audiencia desc
limit 10;

#2. Quais são os 10 filmes mais apreciados pela crítica especializada?
select filme, nota_especialistas
from filmes
order by nota_especialistas desc
limit 10;

#3. Quais são os 10 filmes mais odiados pelo público?
select filme, nota_audiencia
from filmes
order by nota_audiencia asc
limit 10;

#4. Quais são os 10 filmes mais odiados pela crítica especializada?
select filme, nota_especialistas
from filmes
order by nota_especialistas asc
limit 10;

#5. Qual filme com maior custo e qual filme com menor custo?
select filme, custo
from filmes
where custo = (select min(custo) from filmes)
limit 1;

select filme, custo
from filmes
where custo = (select max(custo) from filmes)
limit 1;

#6. Qual a média da nota da crítica especializada?
select avg(nota_especialistas) as media_nota_especialistas
from filmes;

#7. Qual a média da nota do público?
select avg(nota_audiencia) as media_nota_audiencia
from filmes;

#8. Qual a média de custo de filmes?
select avg(custo) as media_custo
from filmes;

#9. Quantos filmes custaram mais do que o custo médio dos filmes da tabela?
select count(filme) as qnt_filmes
from filmes
where custo > (select avg(custo) as media_custo from filmes);

#10. Quais são os filmes com nota acima da média das notas dadas pela crítica especializada?
select count(filme) as qnt_filmes
from filmes
where nota_especialistas > (select avg(nota_especialistas) as media_nota_especialistas from filmes);

#11. Quais são os filmes com nota acima da média das notas dadas pelo público? Quais os melhores?
select count(filme) as qnt_filmes
from filmes
where nota_audiencia > (select avg(nota_audiencia) as media_nota_audiencia from filmes);

#12. Quais são os tipos de categoria (gêneros) existentes?
select distinct genero from filmes;

#13. Quais são os gêneros com maior quantidade de filmes?
select genero, count(filme) as qnt_filmes from filmes
group by genero
order by qnt_filmes desc;

#14. Qual gênero tem a mais alta média de custo?
select genero, avg(custo) as media_custo from filmes
group by genero
order by media_custo desc
limit 1;

#15. Qual gênero tem a mais alta média de nota para o público?
select genero, avg(nota_audiencia) as media_nota_audiencia from filmes
group by genero
order by media_nota_audiencia desc
limit 1;

#16. Qual gênero tem a mais alta média de nota para a crítica especializada?
select genero, avg(nota_especialistas) as media_nota_especialistas from filmes
group by genero
order by media_nota_especialistas desc
limit 1;

#17. Quantos filmes foram produzidos por ano?
select ano, count(filme) as qnt_filmes from filmes
group by ano;

#18. Qual ano foram produzidos mais filmes?
select ano, count(filme) as qnt_filmes from filmes
group by ano
order by qnt_filmes desc
limit 1;

#19. Qual gênero produziu mais filmes em um ano?
select genero, ano, count(filme) as qnt_filmes from filmes
group by genero, ano
order by qnt_filmes desc
limit 1;

#20. Qual o filme mais amado pela audiência e pelos especialistas ao mesmo tempo?
select filme, nota_audiencia, nota_especialistas from filmes
order by nota_audiencia desc, nota_especialistas desc
limit 1;