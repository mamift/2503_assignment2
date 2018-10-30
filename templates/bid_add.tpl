{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - Bid on an item{/block}
{block name='page_content'}

{if $session_user and $session_user_type eq 'admin'}
<form method="post" action="item_add_action.php?table={$table}" id="item-bid-form">
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
					<span class="text-title">New Bid</span>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr class="bid-table-summary-detail">
				<td>Item ID</td>
				<td>
					<input type="number" value="{$item_id}" name="item_id" id="item_id" readonly />
				</td>
			</tr>
			<tr class="bid-table-name-detail">
				<td>Item Name</td>
				<td>
					<div>{$item.name}</div>	
				</td>
			</tr>
			<tr class="bid-table-description-detail">
				<td>Item Description</td>
				<td>
					<div>{$item.description}</div>
				</td>
			</tr>
			<tr class="bid-table-vendor-detail">
				<td>Listed by:</td>
				<td>
					<div id="vendor" class="vendor-info-box">
						<a href="item_detail.php?table={$master_table_list.USER_TABLE}&id={$item.vendor}">
							<strong>{$item.vendor}</strong>  :: View information about this user 
						</a>
					</div>
				</td>
			</tr>
			<tr class="bid-table-starting_price-detail">
				<td>Starting Price: $</td>
				<td>
					<input type="number" name="starting_price" id="starting_price" value="{$item.starting_price}" readonly />
				</td>
			</tr>	
			<tr class="bid-table-starting_price-detail">
				<td>Current Price: $</td>
				<td>
					<input type="number" name="current_price" id="current_price" value="{$item.current_price}" readonly />
					This is the Starting Price plus any additional bids on this item
				</td>
			</tr>	
			<tr class="bid-table-starting_price-detail">
				<td>Current Markup: $</td>
				<td>
					<div><strong>{math equation='0 - sp' sp=$item.starting_price}</strong></div>
					This is the total amount of all the bids placed on this item so far
				</td>
			</tr>		
			<tr class="bid-table-amount-detail">
				<td>Bid Amount: $</td>
				<td>
					<input type="number" name="amount" id="amount" value="" placeholder="Enter an amount"/>
				</td>
			</tr>
			<tr class="bid-table-username_id-detail">
				<td>Your name</td>
				<td>
					<div>{$session_user}</div>
					<input type="text" value="{$session_user}" name="username_id" id="username_id" readonly hidden />
				</td>
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