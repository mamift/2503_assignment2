{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Update Category{/block}
{block name='page_content'}
<form method="get" action="item_update.php">
	{include file='fragment_Tabulus_menu_edit_delete.tpl' assign='edit_delete'}
	
	{if $session_user_type eq 'admin'}
		{$edit_delete}
	{else}
		<div class="tabulus-menu">
			<!-- spacing div -->
		</div>
	{/if}

	{** FORM FOR UPDATING A CATEGORY - USABLE ONLY BY 'admin'-TYPE USERS **}
	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="2">View category</th>
			</tr>
		</thead>
		<tbody>
			<tr class="category-table-id-detail">
				<td>ID</td>
				<td>
					<input type="number" size="1" name="id" value="{$category.id}" readonly />
					<input type="number" name="table" value="{$table}" readonly hidden />
				</td>
			</tr>
			<tr class="category-table-name-detail">
				<td>Name</td>
				<td><div id="name">{$category.name}</div></td>
			</tr>
			<tr class="category-table-name-description">
				<td>Description</td>
				<td><div id="description">{$category.description}</div></td>
			</tr>
			<tr class="record-row">
				<td colspan="2">
					<a href="item_list.php?table={$master_table_list.ITEM_TABLE}&browse={$category.id}">View all items under this category</a>
				</td>
			</tr>
		</tbody>
	</table>
	
	{if $session_user_type eq 'admin'}
		{$edit_delete}
	{else}
		<div class="tabulus-menu">
			<!-- spacing div -->
		</div>
	{/if}

</form>
{/block}
