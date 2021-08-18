GRANT UPDATE on "users" to admin_role; --admin can update
GRANT INSERT on "users" to admin_role; --admin can create new
GRANT SELECT on "users" to admin_role; --admin can view users

--CLIENTS
GRANT UPDATE on "client" to staff_role;
GRANT INSERT on "client" to staff_role; 
GRANT SELECT on "client" to staff_role; 
GRANT DELETE on "client" to staff_role; 
--BILLINGS
GRANT UPDATE on "billings" to staff_role;
GRANT INSERT on "billings" to staff_role; 
GRANT SELECT on "billings" to staff_role; 
GRANT DELETE on "billings" to staff_role; 
--PUMPCRETE
GRANT UPDATE on "pumpcretes" to staff_role;
GRANT INSERT on "pumpcretes" to staff_role; 
GRANT SELECT on "pumpcretes" to staff_role; 
GRANT DELETE on "pumpcretes" to staff_role; 
--CREDIT MEMOS
GRANT UPDATE on "credit_memo" to staff_role;
GRANT INSERT on "credit_memo" to staff_role; 
GRANT SELECT on "credit_memo" to staff_role; 
GRANT DELETE on "credit_memo" to staff_role; 
--PSC
GRANT UPDATE on "psc" to staff_role;
GRANT INSERT on "psc" to staff_role; 
GRANT SELECT on "psc" to staff_role; 
GRANT DELETE on "psc" to staff_role; 

--UPDATE AND VIEW PASSWORD
GRANT UPDATE on "users" to supervisor_role;
GRANT SELECT on "users" to supervisor_role;
--CLIENTS
GRANT UPDATE on "client" to supervisor_role;
GRANT SELECT on "client" to supervisor_role; 
--BILLINGS
GRANT UPDATE on "billings" to supervisor_role;
GRANT SELECT on "billings" to supervisor_role; 
--PUMPCRETE
GRANT UPDATE on "pumpcretes" to supervisor_role;
GRANT SELECT on "pumpcretes" to supervisor_role; 
--CREDIT MEMOS
GRANT UPDATE on "credit_memo" to supervisor_role;
GRANT SELECT on "credit_memo" to supervisor_role; 


