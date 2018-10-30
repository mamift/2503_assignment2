
<!DOCTYPE html>
<html lang="en" dir="ltr">
<!-- 2503ICT Assignment 1 by Muhammad Miftah S2757691 -->
<head>
	<meta charset="utf-8" />
	<!-- IE compatbility --> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>2503ICT AH: Login</title>
	<script type="text/javascript" src="scripts/jquery-1.9.0.min.js"></script>
	<style type="text/css">@import url("styles/default.css");</style>
</head>

<body id="body">

<div id="container">

	<div id="header">
		<h1>
			<a href="index.php">2503ICT: Assignment 2 - Auction House</a>
		</h1>
	</div>
	
	<div id="top-navigation">
		<div class="left-aligned">
			<span class="login-text" id="login-text">
				<a href="login.php">Hello! Please sign in!</a>
			</span>
		</div>

		<div>&nbsp;</div>
	</div>
	
	<div id="content">
		<div id="left-navigation">

		</div>
		<div id="page-content">
			
			{if $action}
				<form method="post" action="login_action.php?goto={$action}">
			{elseif $action and $item_id}
				<form method="post" action="login_action.php?goto={$action}&item_id={$item_id}">
			{else !$action}
				<form method="post" action="login_action.php">
			{/if}
			
				{include file='fragment_Tabulus_menu_submit_reset.tpl' assign='submit_reset'}
				<div class="tabulus-menu">
					{if $error and $error eq 'emptiness'}
						<span class="login-message">Username or password not provided!</span>
					{elseif $error and $error neq 'emptiness'}
						<span class="login-message">Username or password is incorrect!</span>
					{else}
						<span class="text-title">Login</span>
					{/if}
				</div>
					
				<table class="tabulus tabulus-form">
					<thead>
						<tr>
							<th colspan="2">Login</th>
						</tr>
					</thead>
					<tbody>
						<tr class="login-table-username-detail">
							<td>Username</td>
							<td>
								{if $error eq 'emptiness'}
								<input type="text" name="username" placeholder="Username" value="" />
								{else}
								<input type="text" name="username" placeholder="Username" value="{$error}" />
								{/if}
							</td>
						</tr>			
						<tr class="login-table-password-detail">
							<td>Password</td>
							<td><input type="password" name="password" placeholder="Password" value="" /></td>
						</tr>
						<tr class="record-row">
							<td colspan="2">
								If you just want to browse the website, <a href="index.php">click here.</a>
							</td>
						</tr>
					</tbody>
				</table>

				{$submit_reset}	
				
				<table class="tabulus tabulus-form">
					<tfoot>
						<tr>
							<th colspan="2">Not a registered user?</th>
						</tr>
						<tr>
							<td colspan="2">
								<a href="register.php">Click here to register</a>
							</td>
						</tr>
					</tfoot>	
				</table>
			</form>

		</div>
	</div>
	
	<div id="footer">
		By Muhammad Miftah S2757691
	</div>

</div>

</body>

</html>
