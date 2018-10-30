{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Update Category{/block}
{block name='page_content'}

<form method="post" action="item_update_action.php?table={$table}">
	{include file='fragment_Tabulus_menu_submit_reset.tpl' assign='submit_reset_menu'}
	{$submit_reset_menu}

	{** FORM FOR UPDATING A CATEGORY - USABLE ONLY BY 'admin'-TYPE USERS **}
	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="2">Edit category</th>
			</tr>
		</thead>
		<tbody>
			<tr class="category-table-id-detail">
				<td>ID</td>
				<td><input type="number" size="1" name="id" value="{$category.id}" readonly /></td>
			</tr>
			<tr class="category-table-name-detail">
				<td>Name</td>
				<td><input type="text" maxlength="255" size="45" name="name" value="{$category.name}" /></td>
			</tr>
			<tr class="category-table-description-detail">
				<td>Description</td>
				<td><textarea rows="4" cols="35" name="description">{$category.description}</textarea></td>
			</tr>
		</tbody>
	</table>
	
	{$submit_reset_menu}
</form>
{/block}
