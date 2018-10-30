
<!DOCTYPE html>
<html lang="en" dir="ltr">
<!-- 2503ICT Assignment 1 by Muhammad Miftah S2757691 -->
<head>
	<meta charset="utf-8" />
	<!-- IE compatbility --> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>2503ICT AH: Register as a new user</title>
	<script type="text/javascript" src="scripts/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="scripts/register.js"></script>
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
				<a href="login.php">Already registered? Click here to Login</a>
			</span>
		</div>

		<div>
			&nbsp; {*<a href="index.php">Home</a>*}
		</div>
	</div>
	
	<div id="content">
		<div id="left-navigation">

		</div>
		<div id="page-content">

			<form method="post" action="register_action.php" id="register-form">
				{include file='fragment_Tabulus_menu_submit_reset.tpl' assign='submit_reset'}
				
				<div class="tabulus-menu">
					<span class="text-title">Register as a new user</span>
				</div>
	
				<table class="tabulus tabulus-form register-table">
					<thead>
						<tr>
							<th colspan="2">Register</th>
						</tr>
					</thead>
					<tbody>
						<tr class="register-table-username-detail">
							<td>
								<div>Username <span id="username-info-box">* (Required)</span></div>
								<div class="info-box">Please choose a username less than 30 characters long</div>
							</td>
							<td>
								<input type="text" name="username" id="username" placeholder="Username" value="" />
							</td>
						</tr>			
						<tr class="register-table-password-detail">
							<td>
								<div>Password <span id="password-info-box">* (Required)</span></div>
								<div class="info-box">Your password should at least be 6 characters long</div>
							</td>
							<td><input type="password" name="password" id="password" placeholder="Password" value="" /></td>
						</tr>
						<tr class="register-table-firstname-detail">
							<td>
								<div>First name</div>
								<div class="info-box">You don't have to enter this in right now. You can add it in later</div>
							</td>
							<td><input type="text" name="first_name" id="first_name" placeholder="First name" value="" /></td>
						</tr>
						<tr class="register-table-lastname-detail">
							<td>
								<div>Last name</div>
								<div class="info-box">You don't have to enter this in right now. You can add it in later</div>
							</td>
							<td><input type="text" name="last_name" id="last_name" placeholder="Last name" value="" /></td>
						</tr>
						<tr class="register-table-email-detail">
							<td>
								<div>E-mail address</div>
								<div class="info-box">We promise not to spam you!</div>
							</td>
							<td><input type="text" name="email" id="email" placeholder="something@domain.com" value="" /></td>
						</tr>
						<tr class="register-table-description-detail">
							<td>
								<div>Description</div>
								<div class="info-box">If you want, you can add a short description about yourself to help other users get to know you.</div>
							</td>
							<td><textarea name="description" placeholder="I am..."></textarea></td>
						</tr>

					</tbody>
				</table>
			
				<table class="tabulus tabulus-form register-table">
					<tfoot>
						<tr>
							<th colspan="2">Site Rules!</th>
						</tr>
						<tr>
							<td colspan="2">
								<div>
									<input type="checkbox" id="site_rules_i_agree" name="site_rules_i_agree">
									I agree to pay the site administrator a 30% commission on every item that I sell! Yaar!
								</div>
							</td>
						</tr>
					</tfoot>	
				</table>
				
				{$submit_reset}	
				
			</form>
			
			<div class="tabulus-menu">
				<span>
					<!-- this adds a bit of space between tables -->
				</span>
			</div>

			
		</div>
	</div>
	
	<div id="footer">
		By Muhammad Miftah S2757691
	</div>

</div>

</body>

</html>
