{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - User Details{/block}
{block name='page_content'}

<form method="get" action="item_update.php">
	
	{if $session_user eq $user.username}
	<div class="tabulus-menu">
		<input type="submit" value="Edit your information" />	
	</div>
	{else}
	<div class="tabulus-menu">
		<!-- spacing div -->
	</div>
	{/if}
		
	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="2">
					{if $newuser}
						<span class="new-user-message">Welcome, you're a new user!</span>
					{else}
						View User Information
					{/if}
				</th>
			</tr>
		</thead>
		<tbody>
			<tr class="user-table-id-detail">
				<td>ID</td>
				<td>
					<input type="number" size="1" name="id" value="{$user.id}" readonly />
					<input type="number" name="table" value="{$table}" readonly hidden />
				</td>
			</tr>
			<tr class="user-table-username-detail">
				<td>Username</td>
				<td><div>{$user.username}</div></td>
			</tr>
			<tr class="user-table-fullname-detail">
				<td>Full Name</td>
				<td><div>{$user.first_name}&nbsp;{$user.last_name}</div></td>
			</tr>
			<tr class="user-table-description-detail">
				<td>Description </td>
				<td>
					<div id="description">
						{if $user.description eq ''}
							(none set) 
						{else} 
							{$user.description} 
						{/if}
					</div>
				</td>
			</tr>			
			<tr class="user-table-password-detail">
				<td>Change password</td>
				<td>
					<div>
						{if $session_user eq $user.username}
						<a href="item_update.php?table={$master_table_list.USER_TABLE}&id={$user.username}">
							Click here to change your password
						</a>
						{else}
						Login as this user to update their details
						{/if}
					</div>
				</td>
			</tr>
			<tr class="user-table-email-detail">
				<td>E-mail Address</td>
				<td>
					<div>
						<a href="mailto:{$user.e_mail}">{$user.e_mail}</a>
					</div>
				</td>
			</tr>
			<tr class="user-table-type-detail">
				<td>User type</td>
				<td>{$user.first_name} {$user.last_name} is a
					<select> 
					{* The two values 'admin' and 'user' are not stored in the database, but those are the only 
					two values that this web application recognises *}
					{if $user.type eq 'admin'}
						<option value="admin" selected>Administrator</option>
						<option value="user" disabled>User (buyer and seller)</option>
					{elseif $user.type eq 'user'}
						<option value="user" selected>User (buyer and seller)</option>
						<option value="admin" disabled>Administrator</option>
					{/if}
					</select>
					<ul class="info-box">
						<li>Administrator has the powers of a User, plus the ability to add or delete categories and bids.</li>
						<li>User has the power to bid on an iten, list items for sale and also withdraw (delete) items.</li>
					</ul>
				</td>
			</tr>					
		</tbody>
	</table>
	
	<div class="tabulus-menu">
		<!-- spacing div -->
	</div>
	
	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="8">Items listed by this User</th>
			</tr>
			<tr class="search-subheading">
				<th class="item-table-id">				ID</th>
				<!--th class="item-table-vendor">			Vendor</th-->
				<th class="item-table-name">			Name</th> 
				<th class="item-table-description">		Description</th>
				<th class="item-table-category_name">	Category</th>
				<th class="item-table-manufacturer">	Manufacturer</th>
				<th class="item-table-starting_price">	Price</th>
				<th class="item-table-expiration_date">	Last Day</th>
			</tr>
		</thead>
		<tbody>
			{foreach $user_items as $item}
			<tr class="record-row">
				<td class="item-table-id">				{$item.id}</td>
				<!--td class="item-table-vendor">		<a href="item_detail.php?table={$master_table_list.USER_TABLE}&id={$item.vendor_id}">{$item.vendor}</td-->
				<td class="item-table-name">			<a href="item_detail.php?table={$master_table_list.ITEM_TABLE}&id={$item.id}">{$item.name}</a></td>
				<td class="item-table-description">		<a href="item_detail.php?table={$master_table_list.ITEM_TABLE}&id={$item.id}">{$item.description}</a></td>
				<td class="item-table-category_name">	{$item.category_name}</td>
				<td class="item-table-manufacturer">	{$item.manufacturer}</td>
				<td class="item-table-starting_price">	${$item.starting_price}</td>
				<td class="item-table-expiration_date">	{$item.expiration_date|date_format:'%A, %B %e, %Y'}</td>
			</tr>
			{/foreach}
			<tr class="record-row">
				<td colspan="6">{$user_items_count} found</td>
			</tr>
		</tbody>
	</table>
	
	{if $session_user eq $user.username}
	<div class="tabulus-menu">
		<input type="submit" value="Edit your information" />	
	</div>
	{else}
	<div class="tabulus-menu">
		<!-- spacing div -->
	</div>	
	{/if}
	
</form>

{/block}