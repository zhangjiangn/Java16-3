 select  initcap('hello') from dual;--����ĸ���ɴ�д
  select lower('HELLO') from dual;--������ľĸ����Сд
  select upper('hello') from dual;--������ľĸ���ɴ�д
  select length('hello') from dual;--����
  select ltrim('       hello') from dual;--ȥ����߿ո�
  select rtrim('hello     ') from dual;--ȥ���ұ߿ո�
  select translate('jack','j','b') from dual;--����ĸj����b
  select replace('jack','j','b1') from dual;--
  select instr('oracle','a') from dual;--
  select substr('oracle10g',7,3) from dual;--
  select concat('oracle','10g') from dual;--
  select sysdatefrom dual;
  select months_between(to_date('2010-10-21','yyyy-mm-dd'),sysdate)from dual;
  select  add_months(sysdate,5)from dual;
  select next_day(sysdate+12,5)from dual;
  select last_day(sysdate+57)from dual;
  select to_char(sysdate,'yyyy"��"mm"��"dd'"��")from dual;
  select to_char(sysdate,'yyyy-mm-ddday hh24:mi:ss')from dual;
  select to_dater('2012-10-12','yyyy-mm-dd')from dual;
  select to_date('2018-10-22','mm-dd-yyyy')from dual;
  select to_number('$3,925.50','$9,9999.99')from dual;
  select to_number('��3,925.23','L9,9999.99')from dual;
  select to_number('0023','9999')from dual;
  
  update dept set tel=null where dname='�з���'--���Ƚ�����tel�е�ֵ����Ϊ��
  select d.did,d.dname,nvl(d.tel,'��') from dept d;--Ȼ���ѯ
  
  --ʹ�ñ�����ѯ���Ա���ʾΪ����
  select eid, ename,
  case sex 
    when 'm'then '��'
    when 'f'then 'Ů'
    else sex
    end
    from emp;
    --��ѯû��Ա���Ĳ���
  select d.*from dept d where not exists (select .*from emp e where e,did=d.did);  
  
  
  
  
  
  
  
