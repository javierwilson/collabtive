<div class="block_in_wrapper">

	<form class="main" method="post" action="admin.php?action=adduser" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
	<fieldset>

		<div class="row"><label for="name">{#name#}:</label><input type="text" name="name" id="name" required="1" realname="{#name#}" /></div>
		<div class="row"><label for="email">{#email#}:</label><input type="text" name="email" id="email"  realname="{#email#}" /></div>
		<div class="row"><label for="pass">{#password#}:</label><input type="text" name="pass" id="pass" required="1" realname="{#password#}" /></div>
		<div class = "row"><label id = "rate">{#rate#}:</label><input type = "text" name = "rate" id = "rate" /></div>


		<div class="clear_both_b"></div>

		<div class="row"><label>{#projects#}:</label>
		<div style="float:left;">
		{section name=project loop=$projects}
			<div class="row">
	        <input type="checkbox" class="checkbox" value="{$projects[project].ID}" name="assignto[]" id="{$projects[project].ID}"  /><label for="{$projects[project].ID}" style="width:210px;">{$projects[project].name}</label>
	        </div>
	    {/section}
	    </div>
		</div>
	    <div class="clear_both_b"></div>

		<div class="row"><label>{#role#}:</label>

					<select name = "role" realname = "{#role#}" required="1" exclude = "-1" id = "roleselect">
					<option value="-1" selected="selected">{#chooseone#}</option>
					{section name = role loop=$roles}<option value = "{$roles[role].ID}" id="role{$roles[role].ID}">{$roles[role].name}</option>{/section}
					</select>
					<!--<input type="radio" class="checkbox" value="{$roles[role].ID}" name="role" id="role{$roles[role].ID}" realname = "{#role#}" required="1"        /><label for="role{$roles[role].ID}">{$roles[role].name}</label>-->

</div>
	    <div class="clear_both_b"></div>



		<div class="row">
		<label>&nbsp;</label>
		<div class="butn"><button type="submit">{#addbutton#}</button></div>
		<a href = "javascript:blindtoggle('form_member');" class="butn_link"><span>{#cancel#}</span></a>
		</div>


	</fieldset>
	</form>

</div> {*block_in_wrapper end*}