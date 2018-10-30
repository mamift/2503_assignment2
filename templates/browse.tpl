{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Browse Items by Category{/block}
{block name='page_content'}
			
<form action="index.php" method="get">
	<div class="tabulus-menu">	
		<span class="toolbar">
			Browsing under 
			{foreach $categories as $category}
				{if $browse eq $category.id} '{$category.name}' {else} {/if}
			{/foreach}
		</span>
	</div>
				
	<table class="tabulus">
	<thead>
		<tr>
			<th colspan="7">Search</th>
		</tr>
		<tr class="search-subheading">
			<th class="item-table-id">				ID</th>
			<th class="item-table-vendor">			Vendor</th>
			<th class="item-table-name">			Name</th> 
			<th class="item-table-description">		Description</th>
			<th class="item-table-category_name">	Category</th>
			<th class="item-table-manufacturer">	Manufacturer</th>
			<th class="item-table-starting_price">	Price</th>
		</tr>
	</thead>
	<tbody>
		{foreach $browse_items as $item}
		<tr class="record-row">
			<td class="item-table-id">				{$item.id}</td>
			<td class="item-table-vendor">			<a href="item_detail.php?table={$master_table_list.USER_TABLE}&id={$item.vendor_id}">{$item.vendor}</td>
			<td class="item-table-name">			<a href="item_detail.php?table={$table}&id={$item.id}">{$item.name}</a></td>
			<td class="item-table-description">		<a href="item_detail.php?table={$table}&id={$item.id}">{$item.description}</a></td>
			<td class="item-table-category_name">	{$item.category_name}</td>
			<td class="item-table-manufacturer">	{$item.manufacturer}</td>
			<td class="item-table-starting_price">	${$item.starting_price}</td>
		</tr>
		{/foreach}
		<tr class="record-row">
			<td colspan="6">{$browse_items_count} found</td>
		</tr>
	</tbody>
	</table>
	
	<div class="tabulus-menu">
		<span class="toolbar">
			<input type="submit" value="New search" />
		</span>	
	</div>
</form>

{/block}