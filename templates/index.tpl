{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Home Page{/block}
{block name='page_content'}
			
<form method="get" action="search.php" id="search-form">
	<div class="text-box">	
		<h2>Welcome to the Auction House!</h2>
	</div>
	
	{if $session_user}
	<div class="text-box">
		Hello {$session_user}! As you are currently logged in, why not check upon some of your listed sale items?
		Or try searching for more items to bid on.
	</div>
	{else}
	<div class="text-box">
		Hello! You are not currently logged in. You are able to browse items, search and view user's profiles, 
		but you cannot bid on items, or list items for sale.
	</div>	
	{/if}
	
	<div class="text-box">
		To begin, why not try browsing all the listed items by category?
	</div>
		
	<div class="tabulus-menu">
		<span class="toolbar">
			Browse Items
		</span>
	</div>			
	
	<table class="tabulus tabulus-form">
	<thead>
		<tr>
			<th colspan="2">Browse</th>
		</tr>
	</thead>
	<tbody>					
		<tr class="record-row">
			<td>Browse by Category</td>
			<td>
				<select class="browse-by-category" name="browse_by_item_category" onchange="go_browse();"> 
					<option selected>(select an item)</option>
				{foreach $categories as $category}
					<option value="{$category.id}">{$category.name}</option>
				{/foreach}
				</select>
			</td>
		</tr>
		<!--tr class="record-row">
			<td>Browse by Users</td>
			<td>
				<input type="text" class="browse-by-users" value="" />
			</td>
		</tr>
		<tr class="record-row">
			<td>Browse by Expiration Date</td>
			<td>
				<select class="browse-by-expirationdate" onchange=""> 
					<option value="today" selected>Ending today</option>
					<option value="week">Ending this week (last day: Sunday)</option>
					<option value="month">Ending at the end of this month</option>
				</select>
			</td>
		</tr-->
	</tbody>
	</table>
</form>

{/block}