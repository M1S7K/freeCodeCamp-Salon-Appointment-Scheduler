<sectio>
<h1 align="center">Salon Appointment Scheduler</h1>
<h2>Description</h2>
<p>interactive Bash program that uses PostgreSQL to track the customers and appointments for your salon.</p>
<h2>Purpose</h2>
  <p><a href="https://www.freecodecamp.org">freeCodeCamp</a> Relational Database certification</p>
<h2>Required steps</h2>
  <ol>
    <li>Complete the project.</li>
      <ul>
        <li>create a database named "salon"</li>
        <li>Aonnect to the database, then create tables named "customers", "appointments", and "services"</li>
        <li>Each table should have a primary key column that automatically increments</li>
        <li>Each primary key column should follow the naming convention, "table_name_id"</li>
        <li>Appointments table should have a customer_id foreign key that references the customer_id column from the customers table</li>
        <li>Appointments table should have a service_id foreign key that references the service_id column from the services table</li>
        <li>Customers table should have phone that is a VARCHAR and must be unique</li>
        <li>Customers and services tables should have a name column</li>
        <li>Appointments table should have a time column that is a VARCHAR</li>
        <li>Services table should have at least three rows for the different services salon offer, one with a service_id of 1</li>
        <li>Create a script file named salon.sh in the project folder</li>
        <li>Script file should have a “shebang” that uses bash when the file is executed (use #! /bin/bash)</li>
        <li>Script file should have executable permissions</li>
        <li>Do not use the clear command in your script</li>
        <li>Display a numbered list of the services you offer before the first prompt for input, each with the format #) <service>. For example, 1) cut, where 1 is the service_id</li>
        <li>If service doesn't exist, you should be shown the same list of services again</li>
        <li>Script should prompt users to enter a service_id, phone number, a name if they aren’t already a customer, and a time. You should use read to read these inputs into variables named SERVICE_ID_SELECTED, CUSTOMER_PHONE, CUSTOMER_NAME, and SERVICE_TIME</li>
        <li>If a phone number entered doesn’t exist, get the customers name and enter it, and the phone number, into the customers table</li>
        <li>Possibility to create a row in the appointments table by running your script and entering 1, 555-555-5555, Fabio, 10:30 at each request for input if that phone number isn’t in the customers table. The row should have the customer_id for that customer, and the service_id for the service entered</li>
        <li>Possibility to create another row in the appointments table by running your script and entering 2, 555-555-5555, 11am at each request for input if that phone number is already in the customers table. The row should have the customer_id for that customer, and the service_id for the service entered</li>
        <li>After an appointment is successfully added, output the message I have put you down for a <service> at <time>, <name>. For example, if the user chooses cut as the service, 10:30 is entered for the time, and their name is Fabio in the database the output would be I have put you down for a cut at 10:30, Fabio. Make sure your script finishes running after completing any of the tasks above, or else the tests won't pass</li>
      </ul>
    <li>Submit the code.</li>
      <ul>
        <li>Save all the required files into a public repository and submit the URL.</li>
      </ul>
  </ol>
<h2>Result</h2>
<img src="https://raw.githubusercontent.com/M1S7K/freeCodeCamp-Salon-Appointment-Scheduler/main/Terminal.png">
<img src="https://raw.githubusercontent.com/M1S7K/freeCodeCamp-Salon-Appointment-Scheduler/main/Task.png">
<h2>Helpful Links</h2>
<ol>
  <li><a href="https://www.postgresql.org/docs/">PostgreSQL documentation</a></li>
  <li><a href="https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html">Bash documentation</a>
  <li><a href="https://www.freecodecamp.org/learn/relational-database/">freeCodeCamp Relational Database course</a>
</ol>
 </section>
