{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Update Item{/block}
{block name='page_content'}

<form method="post" action="item_update_action.php?table={$table}">
	{include file='fragment_Tabulus_menu_submit_reset.tpl' assign='submit_reset_menu'}
	{$submit_reset_menu}
	
	{if $error}
		<div class="error">All fields must have a value</div>
	{/if}
	{** FORM FOR UPDATING A SALE ITEM **}
	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="2">Edit item</th>
			</tr>
		</thead>
		<tbody>
			<tr class="item-table-id-detail">
				<td>ID</td>
				<td><input type="number" size="1" name="id" value="{$item.id}" readonly /></td>
			</tr>
			<tr class="item-table-name-detail">
				<td>Name</td>
				<td><input type="text" maxlength="255" size="45" name="name" value="{$item.name}"/></td>
			</tr>
			<tr class="item-table-description-detail">
				<td>Description</td>
				<td><textarea rows="4" cols="35" name="description">{$item.description}</textarea></td>
			</tr>
			<tr class="item-table-name-detail">
				<td>Category</td>
				<td>
					<select name="item_category"> 
					{foreach $categories as $category}
						{if $item.category_id eq $category.id}
							<option value="{$category.id}" selected="selected">{$category.name}</option>
						{else}
							<option value="{$category.id}">{$category.name}</option>
						{/if}
					{/foreach}
					</select>
				</td>
			</tr>
			<tr class="item-table-manufacturer-detail">
				<td>Manufacturer</td>
				<td><input type="text" maxlength="255" size="45" name="manufacturer" value="{$item.manufacturer}"/></td>
			</tr>
			<tr class="item-table-starting_price-detail">
				<td>Starting Price ($)</td>
				<td><input type="number" maxlength="8" min="0" max="99999.99" value="{$item.starting_price}" size="6" name="starting_price" /></td>
			</tr>	
			<tr class="item-table-expiration_date-detail">
				<td>Expiration Date</td>
				<td>
					<time datetime="{$item.expiration_date}" ></time>
					<input type="date" maxlength="20" value="{$item.expiration_date}" size="6" name="expiration_date" placeholder="yyyy/mm/dd HH:MM:SS" />
				</td>
			</tr>					
		</tbody>
	</table>	
	{$submit_reset_menu}
</form>

{/block}