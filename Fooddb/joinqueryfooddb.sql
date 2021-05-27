select *
from lineitem
join ticket on ticketId = ticket.id
join menu on menuid = menu.id
join customer on customerid = customer.id;



