<!DOCTYPE html>
<html lang="en" dir="ltr">
<!-- 2503ICT Assignment 2 by Muhammad Miftah S2757691 -->
{* THIS IS THE MASTER TEMPLATE THAT ALL SMARTY TEMPLATES INHERIT FROM *}
{* Blocks in this template:
	- page_title: 		the title of the page; represents the value of the title tag
	- header: 			the div tag, whose id is 'header' (forms the header titel, where the big h1 heading should go)
	- login_text:		the text displayed for a user (if logged in), or the text prompting the user to log in
	- top-navigation: 	the div tag, whose id is 'top-navigation' (forms the topmost link navigation menu)
	- left-navigation: 	a div tag, whose id is 'left-navigation' (forms the left navigation menu, with submenu titles and links)
	- page_content: 	a div tag, id = 'page-content' (all the stuff displayed in the lightest-grey box onscreen)
	- footer: 			displays the footer
*}
<head>
	<meta charset="utf-8" />
	<!-- IE compatbility --> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>
		{block name='page_title'}
			Auction House 
		{/block}
	</title>
	<script type="text/javascript" src="scripts/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="scripts/default.js"></script>
	<style type="text/css">@import url('styles/default.css');</style>
	{block name='page_head'}{/block}
	</head>

<body id="body">

	<div id="container">
	
		<div id="header">
		
			{block name='header'}		
				<h1>
					<a href="index.php">2503ICT: Assignment 2 - Auction House</a>
				</h1>
			{/block}
			
		</div>
		
		<div id="top-navigation">
			<div class="left-aligned">
				<span class="login-text" id="login-text">
				{block name='login_text'}
					{if $session_user}
						<a href="item_detail.php?table={$master_table_list.USER_TABLE}&id={$session_user}" id="user-link">Hi, {$session_user}!</a>
					{else}
					<a href="login.php">Hello! Please sign in!</a>
					{/if}
				{/block}
				</span>
			</div>
			{block name='top-navigation'}
				<div><a href="index.php">Home</a></div>
				<div><a href="documentation/docs.htm">Documentation</a></div>
			{/block}
			
			
			
			<div class="right-aligned">
				<form name="search-box-form" action="item_list.php" method="get">
					 <input type="search" id="table" name="table" value="{$master_table_list.ITEM_TABLE}" hidden readonly />
					 <input type="search" placeholder="Search here..." id="query" name="query" value="Search here..."/>
					 <input type="submit" hidden />
				</form>	
			</div>
		</div>
		
		<div id="content">
			<div id="left-navigation">
			
				{block name='left-navigation'}
					<div class="vertical-submenu">
						<div>View...</div>
						<div><a href="item_list.php?table={$master_table_list.CATEGORY_TABLE}">All Categories</a></div>
						<div><a href="item_list.php?table={$master_table_list.ITEM_TABLE}">All Items</a></div>
						<div><a href="item_list.php?table={$master_table_list.USER_TABLE}">All Users</a></div>
					</div>
					
					<div class="vertical-submenu">
						<div>Add...</div>
						<!--div><a href="item_add.php?table=category">New Category</a></div-->
						<div><a href="item_add.php?table={$master_table_list.ITEM_TABLE}">New Item</a></div>
						<div><a href="item_add.php?table={$master_table_list.CATEGORY_TABLE}">New Category</a></div>
					</div>
					
					<div class="vertical-submenu">
						<div>User...</div>
						{if $session_user}
						<div><a href="logout.php">Logout</a></div>
						<div><a href="item_update.php?id={$session_user}&table={$master_table_list.USER_TABLE}">User Preferences</a></div>
						{else}
						<div><a href="login.php">Login</a></div>
						{/if}
					</div>
				{/block}
				
			</div>
			<div id="page-content">
				
				{block name='page_content'}
				
				{/block}
				
			</div>
		</div>
		
		<div id="footer">
			{block name='footer'}
				<div>By Muhammad Miftah S2757691</div>
			{/block}
		</div>
		
	</div>

</body>

</html>