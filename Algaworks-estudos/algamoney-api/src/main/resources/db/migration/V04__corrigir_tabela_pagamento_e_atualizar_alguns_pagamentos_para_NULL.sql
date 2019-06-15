ALTER TABLE lancamento
CHANGE COLUMN data_pagamento data_pagamento DATETIME NULL ;

CREATE TEMPORARY TABLE new_tbl
select codigo from lancamento a order by rand() limit 37
;
update lancamento set data_pagamento = null where codigo in (select codigo from new_tbl a);

drop table new_tbl;