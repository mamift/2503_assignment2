{* FOR USE IN ITEM_DETAIL.PHP *}
	<div class="tabulus-menu">
		<span>
			{if $session_user}
				{if $session_user eq $item.vendor}
				{* ONLY USERS WHO LISTED AN ITEM CAN EDIT OR DELETE THEM *}
					<input type="submit" value="Edit" />				
					<input type="button" value="Delete" onclick="item_delete({$id}, '{$table}');" />
				{/if}
				<input type="button" value="Bid" onclick="item_bid({$id});" />
			{else !$session_user}
			<div class="login-message">
				<a href="login.php?referrer=bid&item_id={$item.id}">Login to bid or edit this item</a>
			</div>
			{/if}
		</span>
	</div>
