{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Add a new Category{/block}
{block name='page_content'}

{if $session_user and $session_user_type eq 'admin'}
<form method="post" action="item_add_action.php?table={$table}">
	{if $error}
		<div class="error">All fields must have a value. <br/> Use your browser button to go back.</div>
	{else}
		<div class="tabulus-menu">
			<span>
				<input type="submit" value="Submit" />
				<input type="reset" value="Reset" />
			</span>
		</div>
	{/if}
	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="2">
					<span class="text-title">New category</span>
				</th>
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
		</tbody>
	</table>
	{if !$error}
		<div class="tabulus-menu">
			<span>
				<input type="submit" value="Submit" />
				<input type="reset" value="Reset" />
			</span>
		</div>
	{/if}
</form>
{elseif $session_user_type eq 'user'}
	{include file='fragment_Form_not_logged_in_as_admin.tpl'}
{else}
	{include file='fragment_Form_not_logged_in.tpl'}
{/if}

{/block}