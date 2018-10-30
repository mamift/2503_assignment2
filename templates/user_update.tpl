{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Update user{/block}
{block name='page_content'}

<form method="post" action="item_update_action.php?table={$table}">
	{include file='fragment_Tabulus_menu_submit_reset.tpl' assign='submit_reset'}
	{$submit_reset}
		
	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="2">Update User Information</th>
			</tr>
		</thead>
		<tbody>
			<tr class="user-table-id-detail">
				<td>ID</td>
				<td><input type="number" size="1" name="id" value="{$user.id}" readonly /></td>
			</tr>
			<tr class="user-table-username-detail">
				<td>Username</td>
				<td><input type="text" maxlength="255" size="45" name="username" value="{$user.username}"/></td>
			</tr>
			<tr class="user-table-firstname-detail">
				<td>First Name</td>
				<td><input type="text" maxlength="255" size="45" name="first_name" value="{$user.first_name}"/></td>
			</tr>
			<tr class="user-table-lastname-detail">
				<td>Last Name</td>
				<td><input type="text" maxlength="255" size="45" name="last_name" value="{$user.last_name}"/></td>
			</tr>
			<tr class="user-table-description-detail">
				<td>Description <br/>(write stuff about yourself)</td>
				<td><textarea rows="4" cols="35" name="description">{$user.description}</textarea></td>
			</tr>
			<tr class="user-table-password-detail">
				<td>Change password <br/>(blank to leave unchanged)
					{if $error}
						<div class="login-message">Password error! Must be at least 6 characters!</div>
					{/if}
				</td>
				<td><input type="password" maxlength="255" size="45" name="password" placeholder="at least 6 characters" value=""/></td>
			</tr>
			<tr class="user-table-email-detail">
				<td>E-mail Address</td>
				<td><input type="text" maxlength="255" size="45" name="e_mail" value="{$user.e_mail}"/></td>
			</tr>
			<tr class="user-table-type-detail">
				<td>User type</td>
				<td>You are a:
					<select name="type"> 
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

					<input type="text" maxlength="255" size="45" name="salt" value="" readonly hidden />
				</td>
			</tr>	
			<tr>
			</tr>				
		</tbody>
	</table>
	
	{$submit_reset}
</form>

{/block}