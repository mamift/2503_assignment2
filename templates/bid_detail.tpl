{extends file='master.tpl'}

{block name='page_title'}2503ICT AH - View Bid Details{/block}
{block name='page_content'}

<form method="post" action="item_add_action.php?table={$table}" id="item-bid-form">
	<div class="tabulus-menu">
		<!-- -->
	</div>

	<table class="tabulus tabulus-form">
		<thead>
			<tr>
				<th colspan="2">
					<span class="text-title">View Bid Details</span>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr class="bid-table-summary-detail">
				<td>Bid ID</td>
				<td>
					<input type="number" value="{$bid.bid_id}" name="item_id" id="item_id" readonly />
				</td>
			</tr>
			<tr class="bid-table-summary-detail">
				<td>Item ID</td>
				<td>
					<input type="number" value="{$bid.item_id}" name="item_id" id="item_id" readonly />
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
				<td>Bid by:</td>
				<td>
					<div id="vendor" class="vendor-info-box">
						<a href="item_detail.php?table={$master_table_list.USER_TABLE}&id={$bid.username_id}">
							<strong>{$user.username}</strong>  :: View information about this user 
						</a>
					</div>
				</td>
			</tr>
			<tr class="bid-table-starting_price-detail">
				<td>Item's original Starting Price: $</td>
				<td>
					{$item.starting_price}
				</td>
			</tr>
			<tr class="bid-table-bid_date-detail">
				<td>Bid Date</td>
				<td>{$bid.bid_date|date_format:'%A, %B %e, %Y at %I:%M %p'}</td>
			</tr>	
			<tr class="bid-table-amount-detail">
				<td>Bid Amount: $</td>
				<td>
					<div><strong>{$bid.amount}</strong></div>
				</td>
			</tr>
		</tbody>
	</table>
</form>

{/block}