/** go_browse(): list all the items in a category. 
All .tpl files should have (where relevant), a form select tag, called 'item_category' **/
function go_browse() {
	var browse = document.getElementsByName('browse_by_item_category')[0].value; //get the value of the current selected option
	window.location = "item_list.php?table=a2_Item&browse=" + browse;	
}

/** item_delete(): confirm if it's OK to delete this record. **/
function item_delete(id_value, table_value) {	
	var ok = confirm("Are you sure?");
	
	if (ok) {
		window.location = "item_delete_action.php?table=" + table_value + "&id=" + id_value; //invoke the delete action script
	} else {
		window.location.reload();
	}
}

/** item_bid(): bring up the bid form for an item **/
//item_bid({$id});
function item_bid(item_id) {
	window.location = "item_add.php?table=a2_Bid&id=" + item_id;	
}

$(document).ready(function() {
	//Hide this form initially
	//$("#logout-form").hide();
	
	var css_Display__none = {'display':'none'};
	$(".item-table-manufacturer, .item-table-description").css(css_Display__none);
	$(".category-table-id").css(css_Display__none);
	
	$(".user-table-id, .user-table-description, .user-table-password").css(css_Display__none);
//	$(".user-table-id-detail, .item-table-id-detail").css(css_Dispaly__none);

	$("#query").click(function() {
		$(this).val("");
	});
	
	/*
	$("#user-link").hover(
		function() {
			$("#logout-form").show();
		}, 
		function() {}
	);
	
	$("#logout-form").hover(
		function() {}, 
		function() {
			$("#logout-form").hide();
		}
	);
	*/
});