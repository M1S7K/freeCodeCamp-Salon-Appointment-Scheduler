#! /bin/bash
#Salon Appointment Scheduler

#query database 
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
# restart table
#echo $($PSQL "TRUNCATE TABLE appointments CASCADE")
#echo $($PSQL "TRUNCATE TABLE customers CASCADE")
#echo $($PSQL "TRUNCATE TABLE services CASCADE")
#echo $($PSQL "ALTER SEQUENCE appointments_appointment_id_seq RESTART WITH 1")
#echo $($PSQL "ALTER SEQUENCE customers_customer_id_seq RESTART WITH 1")
#echo $($PSQL "ALTER SEQUENCE services_service_id_seq RESTART WITH 1")
#echo $($PSQL "INSERT INTO services(name) VALUES('Hair cut'),('Nails')")

echo -e "\n\n~~ Salon Appointment Scheduler ~~\n"
MAIN_MENU() {
  echo -e "\nLet's make an appointment for you"
  echo -e "\nList of the services:"
  LIST_OF_THE_SERVICES=$($PSQL "SELECT name FROM services ORDER BY service_id")
  echo $LIST_OF_THE_SERVICES | while read HAIR CUT NAILS
  do
    echo -e "\n1) $HAIR $CUT\n2) $NAILS\n3) Exit"
  done
  echo -e "\nPlease type a number of the service you want:"
  read SERVICE_ID_SELECTED
    case $SERVICE_ID_SELECTED in
    1) HAIR_CUT_MENU ;;
    2) NAILS_MENU ;;
    3) EXIT ;;
    *) MAIN_MENU "Sorry we don't provide this service yet." ;;
  esac
}
HAIR_CUT_MENU() {
  # get customer info
  echo -e "\nHair cut service"
  #get customer phone number
  echo -e "\nPlease enter your phone number to make an appointment:"
  read CUSTOMER_PHONE
  # check db
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE' ")
  # if doesn’t exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer name
    echo "Please tell me your name"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  #get customer
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\n\nWeclome $CUSTOMER_NAME!"
  echo "Please enter the time that suits you best:"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED) ")
  echo -e "\nI have put you down for a Hair cut at $SERVICE_TIME, $CUSTOMER_NAME."
}
NAILS_MENU() {
  # get customer info
  echo -e "\nNails service"
  #get customer phone number
  echo -e "\nPlease enter your phone number to make an appointment:"
  read CUSTOMER_PHONE
  # check db
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE' ")
  # if doesn’t exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer name
    echo "Please tell me your name"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  #get customer
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\n\nWelcome $CUSTOMER_NAME!"
  echo "Please enter the time that suits you best:"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED) ")
  echo -e "\nI have put you down for a Nails at $SERVICE_TIME, $CUSTOMER_NAME"
}
EXIT() {
  echo -e "\nThank you for your visit and have a nice day.\n"
}
MAIN_MENU