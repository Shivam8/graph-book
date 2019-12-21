#!/bin/bash

# customizable variables
DSBULK_PATH=/Users/denisegosnell/Desktop/Book/dse-6.8.0_20190911-LABS/dsbulk-1.3.4/bin
DEST_GRAPH=neighborhoods_dev

#
OLDWD="`pwd`"
SCRIPTIR="`dirname $0`"
cd "$SCRIPTDIR"
DATADIR="`pwd`"

DSBULK="`which dsbulk`"
if [ -z "$DSBULK" ]; then
    if [ ! -f "$DSBULK_PATH/bin/dsbulk" ]; then
        echo "Please set DSBULK_PATH variable to top-level path of DSBulk distribution"
        echo "  or add directory with dsbulk to PATH, like, 'PATH=...dsbulk-1.3.4/bin:\$PATH'"
        exit 1
    fi
fi

echo "Loading vertices into the graph neighborhoods_dev"

./dsbulk load -k neighborhoods_dev -t Transaction -url /path/to/graph-book/data/ch4/Transactions.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Vendor -url /path/to/graph-book/data/ch4/Vendors.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Customer -url /path/to/graph-book/data/ch4/Customers.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Loan -url /path/to/graph-book/data/ch4/Loans.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Account -url /path/to/graph-book/data/ch4/Accounts.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t CreditCard -url /path/to/graph-book/data/ch4/CreditCards.csv -header true -schema.allowMissingFields true

echo "Completed loading vertices into the graph neighborhoods_dev."

echo "Loading edges into the graph neighborhoods_dev"

./dsbulk load -k neighborhoods_dev -t Customer__owes__Loan -url /path/to/graph-book/data/ch4/owes.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Customer__owns__Account -url /path/to/graph-book/data/ch4/owns.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Customer__uses__CreditCard -url /path/to/graph-book/data/ch4/uses.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Transaction__charge__CreditCard -url /path/to/graph-book/data/ch4/charge.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Transaction__deposit_to__Account -url /path/to/graph-book/data/ch4/deposit_to.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Transaction__withdraw_from__Account -url /path/to/graph-book/data/ch4/withdraw_from.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Transaction__pay__Loan -url /path/to/graph-book/data/ch4/pay_loan.csv -header true -schema.allowMissingFields true
./dsbulk load -k neighborhoods_dev -t Transaction__pay__Vendor -url /path/to/graph-book/data/ch4/pay_vendor.csv -header true -schema.allowMissingFields true

echo "Completed loading edges into the graph neighborhoods_dev."

cd /path/to/graph-book/data/ch4