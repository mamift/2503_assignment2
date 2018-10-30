select item.item_id, item.name, item.description, category.name as categoryName, item.vendor, item.starting_Price from item
inner join category
on item.category_id = category.category_id