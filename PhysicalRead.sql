set serveroutput on
set feedback off
set linesize 3000 pagesize 9000
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
spool PhysicalRead.html 
prompt  <html>
prompt  <head>
prompt      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
prompt      <title>Highcharts Example</title>
prompt      <style type="text/css">
prompt      </style>
prompt  </head>
prompt   </html>
prompt  <body>
prompt  <script src="code/highcharts.js"></script>
prompt  <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
prompt  <script type="text/javascript">
prompt  Highcharts.chart('container', {
prompt    chart: {type: 'line'},
prompt    title: {text: 'Physical Read Bytes Per Sec'},
prompt    subtitle: {text: 'Author : Buddy Yuan'},
declare
v_BEGIN_TIME varchar2(32767);  
cursor c1
is 
select listagg(''''||to_char(BEGIN_TIME,'HH24:MI')||'''',',') within group (order by BEGIN_TIME) from V$SYSMETRIC_HISTORY where METRIC_NAME='Physical Read Bytes Per Sec';
begin
  open c1;
  loop
  fetch c1 into v_BEGIN_TIME;
  exit when c1%notfound;
  dbms_output.put_line('xAxis: {categories: ['||v_BEGIN_TIME||']},');
  end loop;
  close c1;
end;
/
declare
v_VALUE varchar2(32767) ;
cursor c2
is 
select listagg(VALUE,',') within group (order by VALUE) from V$SYSMETRIC_HISTORY where METRIC_NAME='Physical Read Bytes Per Sec';
begin
  open c2;
  loop
  fetch c2 into v_VALUE;
  exit when c2%notfound;
  dbms_output.put_line('series: [{name: ''Physical Read Bytes Per Sec'',data: ['||v_VALUE||']}],');
  end loop;
  close c2;
end;
/    
prompt   yAxis: {title: {text: 'Physical Read'}},
prompt   plotOptions: {line: {dataLabels: {enabled: false},enableMouseTracking: true}}
prompt   });
prompt   </script>
prompt   <div class="text" style="font-size:9pt;Text-align:right">The copy right of Chart javascript belongs to Highcharts</div>
prompt   </body>
spool off