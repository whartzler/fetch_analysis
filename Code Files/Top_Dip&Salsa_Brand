select brand,sum(t.final_sale) FROM PUBLIC.transactions as t
join public.products as p on t.barcode = p.barcode
where p.category_2 = ''
and brand is not null
group by 1
order by sum(t.final_sale) desc
limit 1
;
