select * from restaurant;
select * from restaurant where id=22;
SELECT ID.NEXTVAL FROM restaurant;
SELECT LAST_NUMBER FROM restaurant_SEQ WHERE SEQUENCE_NAME = 'restaurant_SEQ';

insert into restaurant values(
REST_SEQ.nextval,
'���絷 �ż�����',
'���� ���빮�� �Ѻ��� 11 1��',
'17:00-22:00',
'02-6326-8989',
'������ⱸ��',
'�ż������� ����� ������� ���Ѵٸ� �ż������絷 �����',
'KOREA',
37.5770057135264,
127.02454050475377,
default,
default,
default,
'food2.jpg,food3.jpg,food4.jpg,Gui img.jpg'
);

alter table restaurant add rate_all number default 0 null;
alter table restaurant add rate_cnt number default 0 null;
alter table restaurant add rate_avr number default 0 null;
alter table restaurant add rest_pic varchar2(100) default '-' null;
commit;

select * from menu;

insert into menu values(
menu_SEQ.nextval,
'����� 3�μ�Ʈ (800g)',
'',
'',
79000
);
insert into menu values(
menu_SEQ.nextval,
'����� 3�μ�Ʈ (800g)',
'1.jpg',
'',
60000
);

update restaurant SET rest_pic='1.jpg,2.jpg,3.jpg,4.jpg' where id=22;