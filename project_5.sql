select * from menu;

select * from restaurant;

select * from member;

insert into rest_review values(rest_review_seq.nextval,'aa','5',default,default,default,default);

select * from rest_review;

delete from rest_review where mem_id='aa';

commit;

delete from restaurant where rate_all=0;
alter table restaurant modify rate_cnt number(6,2);

insert into restaurant values(
REST_SEQ.nextval,
'µ·»çµ· ½Å¼³µ¿Á¡',
'¼­¿ï µ¿´ë¹®±¸ ÇÑºû·Î 11 1Ãş',
'17:00-22:00',
'02-6326-8989',
'µÅÁö°í±â±¸ÀÌ',
'½Å¼³µ¿»ï°ã»ì °í±âÁı ¿À°ã»ìÀ» ¿øÇÑ´Ù¸é ½Å¼³µ¿µ·»çµ· °í±êÁı',
'korea',
37.5770057135264,
127.02454050475377,
default,
default,
default,
'food1.jpg,food2.jpg,food3.jpg,food4.jpg'
);

	update restaurant set rate_all = rate_all + 5, rate_cnt = rate_cnt + 1
	where id = 41;
    
   update restaurant set rate_avr = rate_all / rate_cnt;
   
   commit;
   
   
	