﻿<cfsilent>
	<cfset local.userBean	= rc.userBean />
	<cfset local.context	= "profile" />
	<cfinclude template="#rc.MFBean.getThemeRootDirectory()#event/e_md_profile_view.cfm">
</cfsilent>
<cfoutput>
	<div id="profile" class="profileblock">
		<cfmodule template="module/md_profile_view.cfm" local="#local#" userBean="#rc.userBean#">
	</div>
</cfoutput>