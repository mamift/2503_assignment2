{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Item Details{/block}
{block name='page_content'}

<form method="get" action="item_update.php">
	{include file='fragment_Tabulus_menu_edit_delete_bid.tpl' assign='item_menu'}
	{$item_menu}
	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="2">View item</th>
			</tr>
		</thead>
		<tbody>
			<tr class="item-table-id-detail">
				<td>Item ID</td>
				<td>
					<input type="number" size="1" name="id" value="{$item.id}" readonly />
					<input type="number" name="table" value="{$table}" readonly hidden />
				</td>
			</tr>
			<tr class="item-table-name-detail">
				<td>Name</td>
				<td><div id="name">{$item.name}</div></td>
			</tr>
			<tr class="item-table-vendor-detail">
				<td>Listed by:</td>
				<td>
					<div id="vendor" class="vendor-info-box">
						<a href="item_detail.php?table={$master_table_list.USER_TABLE}&id={$item.vendor}">
							<strong>{$item.vendor}</strong>  :: View more by this user 
						</a>
					</div>
				</td>
			</tr>			
			<tr class="item-table-description-detail">
				<td>Description</td>
				<td><div id="description">{$item.description}</div></td>
			</tr>
			<tr class="item-table-category-detail">
				<td>Category</td>
				<td>
					<select name="item_category">
						{foreach $categories as $item_category}
							{if $item.category_id eq $item_category.id}
								<option value="{$item_category.id}" selected="selected">{$item_category.name}</option>
							{else}
								<option value="{$item_category.id}" disabled>{$item_category.name}</option>
							{/if}
						{/foreach}
					</select>
					<a href="item_list.php?table={$master_table_list.ITEM_TABLE}&browse={$item.category_id}">View all items under this category</a>
				</td>
			</tr>
			<tr class="item-table-manufacturer-detail">
				<td>Manufacturer</td>
				<td><div id="manufacturer">{$item.manufacturer}</div></td>
			</tr>
			<tr class="item-table-startingprice-detail">
				<td>Starting Price</td>
				<td><div id="starting_price">$ {$item.starting_price}</div></td>
			</tr>
			<tr class="item-table-expirydate-detail">
				<td>Expiry Date </td>
				<td>
					<div id="expiration_date">
						<strong>{$item.expiration_date|date_format:'%A, %B %e, %Y'} on {$item.expiration_date|date_format:'%I:%M %p'}</strong>
					</div>
					<div>(time before this item is sold to the highest bidder)</div>
				</td>
			</tr>
		</tbody>
	</table>
	{$item_menu}
</form>

{/block}