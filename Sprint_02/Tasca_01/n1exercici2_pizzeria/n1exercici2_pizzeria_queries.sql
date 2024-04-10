use n1exercici2_pizzeria;

select count(*) as numero_begudes_venudes, lo.nom as num_begudes from localitat lo
inner join adreça a on a.id_localitat = lo.id_localitat
inner join botiga bo on bo.id_adreça = a.id_adreça
inner join comanda c on c.id_botiga = bo.id_botiga
inner join linea_comanda l on l.id_comanda = c.id_comanda
inner join beguda b on b.id_beguda = l.id_beguda
where lo.nom = 'Barcelona';

select count(*) as numero_de_comandes_repartides, e.id_empleat as repartidor_id, e.nom, e.cognoms from empleat e
inner join reparto r on r.id_empleat = e.id_empleat
inner join comanda c on c.id_comanda = r.id_comanda
where e.id_empleat = 2
group by e.nom, e.cognoms;




