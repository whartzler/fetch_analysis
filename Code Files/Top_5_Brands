select p.brand, count(t.receipt_id) FROM PUBLIC.transactions as t
join public.products as p on t.barcode = p.barcode
join public.user as u on t.user_id = u.id
where p.brand is not null
and u.birth_date <= current_date - (21*365)
group by p.brand
order by count(t.receipt_id) desc
limit 8
;
