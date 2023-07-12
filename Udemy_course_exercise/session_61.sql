/*select Mayumi Schueller from the employee table of the Employees database
specify what we are selecting, which is all info relevant to Mayumi
*/
SELECT * 
-- specify where the data is located
FROM "public"."employees"
-- instruct Valentina to only return Mayumi's information
WHERE first_name = 'Mayumi' AND last_name = 'Schueller';