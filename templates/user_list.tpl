{extends file='master.tpl'}

{block name='page_title'}2503ICT AH: List Items{/block}
{block name='page_content'}
	<form action="item_add.php" method="get">
		<div class="tabulus-menu">
			<span class="toolbar">
				All Registered Users 
			</span>
		</div>

		<table class="tabulus item-table">
		<thead>
			<tr>
				<th class="user-table-id">			ID</th>
				<th class="user-table-username">	Username</th> 
				<th class="user-table-firstname">	First Name</th>
				<th class="user-table-lastname">	Last Name</th>
				<th class="user-table-description">	Description</th>
				<th class="user-table-password">	Password</th>
				<th class="user-table-email">		E-Mail</th>
				<th class="user-table-type">		Type</th>
			</tr>
		</thead>
		<tbody>
			{foreach $all_users as $user}
			{if $user.username eq $session_user}
			<tr class="record-row this-is-youser">
				<td class="user-table-id">			{$user.id}</td>
				<td class="user-table-username">	<a href="item_detail.php?table={$table}&id={$user.id}">{$user.username}</a>  (this is you)</td>
				<td class="user-table-firstname">	<a href="item_detail.php?table={$table}&id={$user.id}">{$user.first_name}</a></td>
				<td class="user-table-lastname">	{$user.last_name}</td>
				<td class="user-table-description">	{$user.description}</td>
				<td class="user-table-password">	{$user.password}</td>
				<td class="user-table-email">		<a href="malto:{$user.e_mail}">{$user.e_mail}</a></td>
				<td class="user-table-type">		{$user.type}</td>
			</tr>		
			{else}
			<tr class="record-row">
				<td class="user-table-id">			{$user.id}</td>
				<td class="user-table-username">	<a href="item_detail.php?table={$table}&id={$user.id}">{$user.username}</a></td>
				<td class="user-table-firstname">	<a href="item_detail.php?table={$table}&id={$user.id}">{$user.first_name}</a></td>
				<td class="user-table-lastname">	{$user.last_name}</td>
				<td class="user-table-description">	{$user.description}</td>
				<td class="user-table-password">	{$user.password}</td>
				<td class="user-table-email">		<a href="malto:{$user.e_mail}">{$user.e_mail}</a></td>
				<td class="user-table-type">		{$user.type}</td>
			</tr>
			{/if}
			{/foreach}
		</tbody>			
		</table>
		
		<div class="tabulus-menu">
			<span class="toolbar">

			</span>
		</div>
		
	</form>
{/block}
