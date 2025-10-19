/*
PurchaseID primary key int not null unique
PurchaseTime datetime not before today not null not blank
purchaseitem varchur(30) not null not blank
pricePerItem decimal(5,2) not null 
PaymentMethod varchur must be either cash or card not null not blank 
*/

drop table if exists CoffeKiosk
go
create table dbo.CoffeKiosk(
    PurshaseId int not null identity primary key,
    PurchaseDate date not null constraint CoffeeKiosk_Purchase_time_cannot_be_after_current_date check(PurchaseDate <= getdate()),
    PurchaseItem varchar(30) not null constraint CoffeeKiosk_Purchase_Item_cannot_be_blank check(purchaseitem <> ''),
    PricePerItem decimal(5,2) not null constraint CoffeeKiosk_Price_Per_Item_cannot_be_a_negativa_number check(pricePerItem >= 0),
    Quantity int not null,
    TotalPrice as PricePerItem * Quantity persisted,
    PaymentMethod varchar(5) not null constraint CoffeKiosk_Payment_Method_must_be_eater_cash_or_card check(PaymentMethod in ('cash' , 'card'))
)