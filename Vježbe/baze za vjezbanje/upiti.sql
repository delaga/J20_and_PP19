select * from grupa;
select * from smjer;
insert into grupa(naziv,smjer,predavac) values('Novi',1,1);

select a.sifra,a.naziv,b.naziv as smjer from grupa a inner join smjer b on a.smjer=b.sifra;

select a.sifra,a.naziv,b.naziv as smjer from grupa a left join smjer b on a.smjer=b.sifra;

select a.sifra,a.naziv,b.naziv as smjer from grupa a right join smjer b on a.smjer=b.sifra;

select b.sifra,b.naziv,a.naziv as smjer from smjer a left join grupa b on b.smjer=a.sifra;

select a.naziv as grupa, b.naziv as smjer, d.ime,d.prezime 
from grupa a inner join smjer b on a.smjer=b.sifra 
left join  predavac c on a.predavac=c.sifra
left join osoba d on c.osoba=d.sifra;

select a.naziv,d.ime,d.prezime
from grupa a 
inner join clan b on a.sifra=b.grupa
inner join polaznik c on b.polaznik=c.sifra
inner join osoba d on c.osoba=d.sifra where a.naziv='J20';

insert into clan(grupa,polaznik) values(2,8);

select b.ime from polaznik a inner join osoba b on a.osoba=b.sifra where b.email is not null;


select concat(b.ime,' ',b.prezime) as autor, a.naslov,c.naziv as izdavac,d.naziv as mjesto 
from katalog a 
inner join autor b on a.autor=b.sifra
inner join izdavac c on a.izdavac=c.sifra
inner join mjesto d on a.mjesto=d.sifra
where /*a.naslov like '%ljubav%' and*/ a.sifra in(2660,2664,2879,2938);

select a.naslov
from katalog a
inner join autor b on a.autor=b.sifra
where b.datumrodenja between '1980-01-01' and '1980-12-31';

select a.`productName`
from products a 
inner join productlines b on a.`productLine`=b.`productLine` where b.`productLine`='Trains';

select distinct concat(a.`contactFirstName`,' ', a.`contactLastName`) as korisnik, d.`productName` as 'je kupio', b.`orderDate` as dana
from customers a 
inner join orders b on a.`customerNumber`=b.`customerNumber`
inner join orderdetails c on b.`orderNumber`=c.`orderNumber`
inner join products d on c.`productCode`=d.`productCode`
inner join productlines e on d.`productLine`=e.`productLine`
where e.`productLine`='Trains';





















