{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Add a new Item{/block}
{block name='page_content'}

{if $session_user}
<form method="post" action="item_add_action.php?table={$table}">
	{if $error}
	<div class="error">All fields must have a value. Also, Starting Price must be a number!</div>
	{else}
	<div class="tabulus-menu">
		<!-- spacing div -->
	</div>
	{/if}
	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="2">New item</th>
			</tr>
		</thead>
		<tbody class="">
			<tr>
				<td>Name</td>
				<td><input type="text" maxlength="255" size="45" name="name"/></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><textarea rows="4" cols="35" name="description"></textarea></td>
			</tr>
			<tr>
				<td>Category</td>
				<td>
					<select name="item_category"> 
						<option value="" selected />
					{foreach $categories as $category}
						<option value="{$category.id}">{$category.name}</option>
					{/foreach}
					</select>
				</td>
			</tr>
			<tr>
				<td>Manufacturer</td>
				<td><input type="text" maxlength="255" size="45" name="manufacturer"/></td>
			</tr>
			<tr>
				<td>Starting Price ($)</td>
				<td><input type="number" maxlength="10" min="0" max="99999.99" value="0.00" size="6" name="starting_price" /></td>
			</tr>	
			<tr>
				<td>Expiration Date</td>
				<td>
					<input type="text" maxlength="10" value="" size="12" name="expiration_date" placeholder="yyyy/mm/dd" />
					<!--input type="text" maxlength="8" value="" size="12" name="expiration_time" placeholder="hh:mm:ss" /-->
					<input type="number" maxlength="3" value="{$session_user_id}" size="2" name="seller_username_id" readonly hidden />
				</td>
			</tr>
		</tbody>
	</table>	
	<div class="tabulus-menu">
		<span>
			<input type="submit" value="Submit" />
			<input type="reset" value="Reset" />
		</span>
	</div>
</form>
{else}
	{include file='fragment_Form_not_logged_in.tpl'}
{/if}

{/block}