* najpierw sprawdze pieniadze klienta
* nastepnie sprawdze cene biletu.
* potem cene biletu odejme od pieniedzy klienta
* uzywajac custumer.funds sprawdze ile klient ma kasy.
* uzywajac ticket.film_id sprawdze film_id
* dobrawszy sie do filmu, sprawdze film.price
* porownam customer.funds z film.price
* jezeli customer.funds >= film.price, to odejme: customer.funds - funds-film.price
* potem customer.funds -= film.price i stosuje metode update
