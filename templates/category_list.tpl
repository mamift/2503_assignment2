{extends file='master.tpl'}

{block name='page_title'}2503ICT AH: View Categories{/block}
{block name='page_content'}

	<form action="item_add.php" method="get">
		<div class="tabulus-menu">
			<span class="toolbar">
				All Categories of Items 
			</span>
		</div>
	
		<table class="tabulus">
		<thead>
			<tr>
				<th class="category-table-id">				ID</th>
				<th class="category-table-name">			Name</th> 
				<th class="category-table-description">		Description</th>
			</tr>
		</thead>
		<tbody>
			{foreach $all_categories as $category}
			<tr class="record-row">
				<td class="category-table-id">				{$category.id}</td>
				<td class="category-table-name">			<a href="item_detail.php?table={$table}&id={$category.id}">{$category.name}</a></td>
				<td class="category-table-description">		<a href="item_detail.php?table={$table}&id={$category.id}">{$category.description}</a></td>
			</tr>
			{/foreach}
		</tbody>
		</table>
		
		<div class="tabulus-menu">
			<span class="toolbar">
	
			</span>
		</div>
		
	</form>
{/block}