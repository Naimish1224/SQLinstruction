select ticketid, name, price, quantity, concat(firstname, ', ', lastname) as 'Customer name', concat('$',(price * quantity)) as subtotal
from lineitem
join ticket on ticketId = ticket.id
join menu on menuid = menu.id
join customer on customerid = customer.id;








