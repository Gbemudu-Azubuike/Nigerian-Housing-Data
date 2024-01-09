-- Veiwing  all the rows and column in our table

select *
from [Nigerian Housing Data]


-- Top 10 most Expensive Houses
     select top 10 *
     from [Nigerian Housing Data]
     order by price desc


-- Nigerian Market Segmentation

   --Type of properties, Count and average price of property

   select title, COUNT(*) as Count, avg(Price) as Average_Price
   from [Nigerian Housing Data]
   group by title



-- Price and Market Analysis

   -- Average Price Analysis
      select bedrooms, bathrooms, parking_space, AVG(price) as Average_Price
      from [Nigerian Housing Data]
      where price between 100000000 and 300000000
      group by bedrooms, bathrooms, parking_space
   
   -- Price corrolation 

	 -- Maximum and Minimum Price in every town

	 select town, MAX(price), min (Price)
     from [Nigerian Housing Data]
     group by town

      -- Average cost of house in a state (Lagos)
  
      select AVG(price) AS Average_House_Price
      from [Nigerian Housing Data]
      where state = 'Lagos'

	  -- Average Cost of Houses in a town (Lekki)

      Select town, AVG (price) as Avg_Price
      from [SQL Practise]..[Nigerian Housing Data]
      where town = 'Lekki'
      group by price
      order by Avg_Price
      
   -- Feature correlation
        
		--Average price per bedroom In Each town in every state
  
           Select state, town, bedrooms, title, COUNT(bedrooms) as No_of_Appartment, AVG (price/bedrooms) as avg_price_per_bedroom
           from [Nigerian Housing Data]
           group by town, state, bedrooms,title
           order by state, avg_price_per_bedroom desc

        -- Average Price per bathroom In Each town in every state

           Select state, town, bathrooms, title, COUNT(bathrooms) as No_of_Appartment, AVG (price/bathrooms) as avg_price_per_bathroom
           from [Nigerian Housing Data]
           group by town, state, bathrooms,title
           order by state, avg_price_per_bathroom desc

        -- Average Price per parking space In Each town in every state

           Select state, town, parking_space, title, COUNT(parking_space) as No_of_Appartment, AVG (price/parking_space) as avg_price_per_parking_Space
           from [Nigerian Housing Data]
           group by town, state, parking_space,title
           order by state, avg_price_per_parking_Space desc


   -- Location Analysis
   
      --Price Distribution by town

        select town, AVG(price) as Average_Price, MIN (price) as Min_Price, MAX(price) as Max_Price
        from [Nigerian Housing Data]
        group by town

	   -- Property count per town in each state
		   select town, state, count(*) as Property_count
           from [Nigerian Housing Data]
           group by town, state
		
	  -- Part of town in a state (Lagos) with the Most houses
		   Select town, COUNT (town) as No_of_Houses
           from [SQL Practise]..[Nigerian Housing Data]
           where state = 'Lagos'
           group by town
           order by No_of_Houses desc

	    -- Impact of title on Price

           select title, AVG(price) as Average_Price_By_Title
           from [Nigerian Housing Data]
           group by title
           order by Average_Price_By_Title desc

  
  -- Outliers (Exceptionally High Prices)
 select *
 from [Nigerian Housing Data]
 where price > (select AVG(price) + 2* STDEV(price) from [Nigerian Housing Data])

 -- Outliers (Exceptionally low Prices)
 select *
 from [Nigerian Housing Data]
 where price < (select AVG(price) + 2* STDEV(price) from [Nigerian Housing Data])
 order by price

