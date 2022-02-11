# Pewlett Hackard Analysis

## Overview of the Analysis
This project is to find out how many employees from each department are retiring so that thw vacancies are generated to fill those positions and current available employees eligible for mentorship within the company.

## Results
1. Created a separate table by joing the employees and titles table to show each employees first name, last name, titles and their joining dates and the date they were with the company. For the employees still with the company the to date is shown as "9999-01-01".
2. Using the table "retirement_titles", the duplicate rows are removed as there were employees who were promoted to a different title so as to maintain the table with unique records for each of the employees.
3. These cleaned up records from "retirement_titles" were saved into a new table named "unique_titles".
4. Another table "mentorship_eligibilty" was created using the "unique_titles" to show the employees who are currently working with the company and who are aged 56-57, eligible for the mentorship program.

## Summary
To learn more about the current employees who have been promoted twice or more, I created a table **current_employees** with their emp_no, name titles, and From and to date. 
Next I created a table **emp_promo** to count the employees who have been promoted twice or more. Please note that for this the employee count will be three or more.
Finally I have joined the emp_promo table with titles table creating a new table **promo_list** which only has the promoted current employees showing the emp_no, title, from date and to date.
Using promo_list, the management can actually think of an employee reward program to retain the current employees while attracting new ones.
