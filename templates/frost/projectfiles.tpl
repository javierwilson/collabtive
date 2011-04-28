{include file="header.tpl" jsload = "ajax" jsload3 = "lightbox" }

{include file="tabsmenue-project.tpl" filestab = "active"}
<div id="content-left">
<div id="content-left-in">
<div class="files">


	<div class="infowin_left" >
	<span id = "deleted" style = "display:none;" class="info_in_red"><img src="templates/frost/images/symbols/files.png" alt=""/>{#filewasdeleted#}</span>
	</div>

	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "added"}
		<span class="info_in_green"><img src="templates/frost/images/symbols/files.png" alt=""/>{#filewasadded#}</span>
		{elseif $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/frost/images/symbols/files.png" alt=""/>{#filewasedited#}</span>
		{elseif $mode == "folderadded"}
		<span class="info_in_green"><img src="templates/frost/images/symbols/folder.png" alt=""/>{#folderwasadded#}</span>
		{elseif $mode == "folderedited"}
		<span class="info_in_yellow"><img src="templates/frost/images/symbols/folder.png" alt=""/>{#folderwasedited#}</span>
		{elseif $mode == "folderdel"}
		<span class="info_in_red"><img src="templates/frost/images/symbols/folder.png" alt=""/>{#folderwasdeleted#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	systemMsg('systemmsg');

	 </script>
	{/literal}

<h1>{$projectname}<span>/ {#files#}</span></h1>

			<div class="headline">
				<a href="javascript:void(0);" id="block_files_toggle" class="win_block" onclick = "toggleBlock('block_files');"></a>

				<div class="wintools">
				<div class="addmen">
					<div class="export-main">
						<a class="export"><span>{#addbutton#}</span></a>
						<div class="export-in"  style="width:54px;left: -54px;"> {*at two items*}
						{if $userpermissions.files.add}
							<a class="addfile" href="javascript:blindtoggle('form_file');" id="addfile" onclick="toggleClass(this,'addfile-active','addfile');toggleClass('add_file_butn','butn_link_active','butn_link');toggleClass('sm_files','smooth','nosmooth');"><span>{#addfile#}</span></a>
							<a class="addfolder" href="javascript:blindtoggle('form_folder');" id="addfolder" onclick="toggleClass(this,'addfolder-active','addfolder');toggleClass('add_folder_butn','butn_link_active','butn_link');toggleClass('sm_files','smooth','nosmooth');"><span>{#addfolder#}</span></a>	{/if}
						</div>
					</div>
				</div>
				</div>

				<h2>
					<img src="./templates/frost/images/symbols/folder-root.png" alt="" /><span id = "dirname">{#rootdir#}</span>
				</h2>
			</div>

			<div id="block_files" class="blockwrapper">
				{*Add Folder*}
				{if $userpermissions.files.add}
					<div id = "form_folder" class="addmenue" style = "display:none;">
						{include file="addfolder.tpl" }
					</div>
				{/if}


				{*Add File*}
				{if $userpermissions.files.add}
						<div id = "form_file" class="addmenue" style = "display:none;">
							{include file="addfileform.tpl" }
						</div>
				{/if}



			<div class="nosmooth" id="sm_files">
			<div class="contenttitle">
				<div class="contenttitle_menue">
					<a id = "dirUp" class="dir_up_butn" href="javascript:change('manageajax.php?action=fileview&id={$project.ID}&folder=0','filescontent');" title=""></a>

				</div>
				<div class="contenttitle_in">
					<a href="manageajax.php?action=fileview&id={$project.ID}&folder={$folders[fold].ID}"><!--pfad--></a>
				</div>
			</div>
			<div class="content_in_wrapper">
			<div class="content_in_wrapper_in">

						<div id = "filescontent" class="inwrapper" >
							<ul>
							{section name=fold loop=$folders}
								<li id="fdli_{$folders[fold].ID}" >
									<div class="itemwrapper" id="iw_{$folders[fold].ID}" >

											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td class="leftmen" valign="top">
														<div class="inmenue">
															<a class="export" href="managefile.php?action=folderexport&file={$folders[fold].ID}&id={$project.ID}" title="{#export#}"></a>
														</div>
													</td>
													<td class="thumb">
													 	<a href = "javascript:change('manageajax.php?action=fileview&id={$project.ID}&folder={$folders[fold].ID}','filescontent');">
													 		<img src="./templates/frost/images/symbols/folder-sub.png" alt="" />
													 	</a>
													</td>
													<td class="rightmen" valign="top">
														<div class="inmenue">
														{if $userpermissions.files.del}
															<a class="del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'iw_{$folders[fold].ID}\',\'managefile.php?action=delfolder&amp;id={$project.ID}&amp;folder={$folders[fold].ID}&ajax=1\')');fadeToggle('iw_{$folders[fold].ID}');" title="{#delete#}" ></a>
															<!-- <a class="edit" href="#" title="{#editfile#}"></a>-->
														{/if}
                                                        </div>
													</td>
												</tr>
												<tr>
													<td colspan="3">
														<span class="name">
															<a href = "{$myprojects[project].messages[message].files[file].datei}"{if $myprojects[project].messages[message].files[file].imgfile == 1} rel="lytebox[img{$myprojects[project].messages[message].ID}]" {elseif $myprojects[project].messages[message].files[file].imgfile == 2} rel = "lyteframe[text{$myprojects[project].messages[message].ID}]"{/if} title="{$myprojects[project].messages[message].files[file].name}" >
																{if $folders[fold].name != ""}
																	{$folders[fold].name|truncate:13:"...":true}
																{else}
																	{#folder#}
																{/if}

															</a>
														</span>
													</td>
												<tr/>
											</table>

									</div> {*itemwrapper End*}
								</li>
							{/section} {*lop folder End*}


							{section name=file loop=$files}
								<li id = "fli_{$files[file].ID}">
									<div class="itemwrapper" id="iw_{$files[file].ID}">

											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td class="leftmen" valign="top">
														<div class="inmenue">

														</div>
													</td>
													<td class="thumb">
													 	<a href = "{$files[file].datei}" {if $files[file].imgfile == 1} rel="lytebox[]" {elseif $files[file].imgfile == 2} rel = "lyteframe[text]" rev="width: 650px; height: 500px;"{/if} >
													 		{if $files[file].imgfile == 1}
													 		<img src = "thumb.php?pic={$files[file].datei}&amp;width=32" alt="{$files[file].name}" />
													 		{else}
													 		<img src = "templates/frost/images/files/{$files[file].type}.png" alt="{$files[file].name}" />
													 		{/if}
													 	</a>
													</td>
													<td class="rightmen" valign="top">
														<div class="inmenue">
														{if $userpermissions.files.del}
													<a class="del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'iw_{$files[file].ID}\',\'managefile.php?action=delete&amp;id={$project.ID}&amp;file={$files[file].ID}\')');" title="{#delete#}"></a>
													{/if}
													{if $userpermissions.files.edit}
														<a class="edit" href="managefile.php?action=editform&amp;id={$project.ID}&amp;file={$files[file].ID}" title="{#editfile#}"></a>{/if}
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="3">
														<span class="name">
															<a href = "{$files[file].datei}"{if $files[file].imgfile == 1} rel="lytebox[img{$files[file].ID}]" {elseif $files[file].imgfile == 2} rel = "lyteframe[text{$files[file].ID}]"{/if} title="{$files[file].name}" {if !$files[file].seen}style="color:#4CA543"{/if} >
																{if $files[file].title != ""}
																{$files[file].title|truncate:13:"...":true}
																{else}
																{$files[file].name|truncate:13:"...":true}
																{/if}


															</a>
														</span>
													</td>
												<tr/>
											</table>

									</div> {*itemwrapper End*}
								</li>
								{literal}
                                    <script type = "text/javascript">
                                    try
                                    {
                                        new Draggable('{/literal}fli_{$files[file].ID}{literal}',{revert:true});
                                    }
                                    catch(e){}
                                    </script>
                                {/literal}

							{/section} {*files in fldes End*}
							</ul>
						</div> {*inwrapper End*}


		{section name=fold loop=$folders}
						   {literal}
								 <script type = "text/javascript">
								 try{
                                     Droppables.add('{/literal}fdli_{$folders[fold].ID}{literal}',{
                                     onDrop: function(element) {
                                     change('managefile.php?action=movefile&id={/literal}{$project.ID}{literal}&file='+element.id+'&target={/literal}{$folders[fold].ID}{literal}','jslog');
                                     element.hide();
                                     }

                                   });
                                   }
                                   catch(e){}
                                </script>
                            {/literal}
        {/section}
			</div> {*content_in_wrapper_in End*}

			</div> {*content_in_wrapper End*}

			<div class="staterow">


				<div class="staterowin">
					<span id = "filenum">{$filenum}</span> {#files#}

				</div>

				<div class="staterowin_right"> <span >{$langfile.page} {paginate_prev} {paginate_middle} {paginate_next}</span>

				</div>
			</div>




			</div> {*nosmooth End*}
			<div class="tablemenue">
					<div class="tablemenue-in">
						{if $userpermissions.files.add}
						<a class="butn_link" href="javascript:blindtoggle('form_file');" id="add_file_butn" onclick="toggleClass('addfile','addfile-active','addfile');toggleClass(this,'butn_link_active','butn_link');toggleClass('sm_files','smooth','nosmooth');">{#addfile#}</a>
						<a class="butn_link" href="javascript:blindtoggle('form_folder');" id="add_folder_butn" onclick="toggleClass(this,'butn_link_active','butn_link');toggleClass('addfolder','addfolder-active','addfolder');toggleClass('sm_files','smooth','nosmooth');">{#addfolder#}</a>
						{/if}
					</div>
			</div>
			</div> {*block_files End*}



			<div class="content-spacer"></div>



</div> {*Files END*}
</div> {*content-left-in END*}
</div> {*content-left END*}
{include file="sidebar-a.tpl"}
{include file="footer.tpl"}