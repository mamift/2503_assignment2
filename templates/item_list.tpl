{extends file='master.tpl'}

{block name='page_title'}2503ICT AH: List Items{/block}
{block name='page_content'}

<form action="item_add.php" method="get">
	<div class="tabulus-menu">
		<span class="toolbar">
			All Items for Sale 
		</span>
	</div>

	<table class="tabulus item-table">
	<thead>
		<tr>
			<th class="item-table-id">				ID</th>
			<th class="item-table-vendor">			Vendor</th>
			<th class="item-table-name">			Name</th> 
			<th class="item-table-description">		Description</th>
			<th class="item-table-category_name">	Category</th>
			<th class="item-table-manufacturer">	Manufacturer</th>
			<th class="item-table-starting_price">	Price</th>
			<th class="item-table-expiration_date">	Last Day</th>
		</tr>
	</thead>
	<tbody>
		{foreach $all_items as $item}
		<tr class="record-row">
			<td class="item-table-id">				{$item.id}</td>
			<td class="item-table-vendor">			<a href="item_detail.php?table={$master_table_list.USER_TABLE}&id={$item.vendor_id}">{$item.vendor}</td>
			<td class="item-table-name">			<a href="item_detail.php?table={$table}&id={$item.id}">{$item.name}</a></td>
			<td class="item-table-description">		<a href="item_detail.php?table={$table}&id={$item.id}">{$item.description}</a></td>
			<td class="item-table-category_name">	{$item.category_name}</td>
			<td class="item-table-manufacturer">	{$item.manufacturer}</td>
			<td class="item-table-starting_price">	${$item.starting_price}</td>
			<td class="item-table-expiration_date">	{$item.expiration_date|date_format:'%A, %B %e, %Y'}</td>
		</tr>
		{/foreach}
	</tbody>			
	</table>
	
	<div class="tabulus-menu">
		<span class="toolbar">

		</span>
	</div>
	
</form>
{/block}
