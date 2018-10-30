
/** Search for items by str **/
select $item_tbl.id, $item_tbl.name, $item_tbl.description, $category_tbl.name 
			    as category_name, $item_tbl.manufacturer, $item_tbl.starting_price from $item_tbl 
	    		inner join $category_tbl on $item_tbl.category_name = $category_tbl.name 
	    		where $item_tbl.name like '%Apple%' 
                or $item_tbl.description like '%Apple%' 
                or $item_tbl.manufacturer like '%Apple%'
                or category_name like '%Apple%';
