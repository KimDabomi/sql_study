update city_popul 
    set city_name = '서울' 
    where city_name = 'Seoul';
update city_popul 
    set city_name = '뉴욕', population = 0
    where city_name = 'New York';
update city_popul
    set population = population / 10000;
    