-- 1. How  can we store large-object types?
-- Character large objects (CLOBs)
-- Use the CLOB data type to store SBCS or mixed data, such as documents that contain single character set.

-- Double-byte character large objects (DBCLOBs)
-- Use the DBCLOB data type to store large amounts of DBCS data, such as documents that use a DBCS character set.

-- Binary large objects (BLOBs)
-- Use the BLOB data type to store large amounts of noncharacter data, such as pictures, voice, and mixed media.


--2
CREATE role accontant LOGIN;
CREATE role administrator LOGIN ;
CREATE role support LOGIN ;

GRANT SELECT, UPDATE, INSERT on accounts,transactions to "accontant";
GRANT all on transactions,accounts,customers to "administrator";
GRANT SELECT, UPDATE, INSERT on accounts,transactions to "support";

CREATE user "Yerkin";

CREATE user "Yerka";

CREATE user "YerkinBS" ;

grant "accontant" to "Yerkin";
grant "administrator" to "Yerka";
grant "support" to "YerkinBS";

revoke SELECT, UPDATE on customers from "Yerkin";
revoke Insert on accounts,transactions from "Yerka";

--5 task
CREATE UNIQUE INDEX curr on accounts(currency, account_id);
create index checkk on accounts(currency,balance);

--6 task
begin;
update accounts set balance = balance-50
    where account_id in (
        select account_id
        from transactions,accounts
        where account_id = transactions.src_account
        );
update accounts set balance = balance + 50
    where account_id not in (
        select account_id
        from accounts,transactions
        where account_id=src_account
    );
if exists (select accounts_id,balance,limit
from accounts,transactions
where accounts_id=src_account,balance<limit)
then rollback;
commit;
