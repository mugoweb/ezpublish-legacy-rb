{*?template charset=latin1?*}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="no" lang="no">

{let pagedesign=fetch_alias(by_identifier,hash(attr_id,intranet888))}

<head>
<link rel="stylesheet" type="text/css" href={"stylesheets/intranet_leftmenu.css"|ezdesign} />
{* <link rel="stylesheet" type="text/css" href="/{$pagedesign.data_map.css.content|ezpackage(filepath,"cssfile")}" /> *}

{* page header start *}
{default enable_help=true() enable_link=true()}

{let name=Path
     path=$module_result.path
     reverse_path=array()}
{section show=is_set($module_result.title_path)}
    {set path=$module_result.title_path}
{/section}
{section loop=$:path}
    {set reverse_path=$:reverse_path|array_prepend($:item)}
{/section}

{set-block scope=root variable=site_title}
{section loop=$Path:reverse_path}{$:item.text|wash}{delimiter} / {/delimiter}{/section} - {$site.title|wash}
{/set-block}

{/let}

<title>{$site_title}</title>

{section show=and(is_set($#Header:extra_data),is_array($#Header:extra_data))}
    {section name=ExtraData loop=$#Header:extra_data}
        {$:item}
    {/section}
{/section}

{* check if we need a http-equiv refresh *}
{section show=$site.redirect}
    <meta http-equiv="Refresh" content="{$site.redirect.timer}; URL={$site.redirect.location}" />
{/section}

{section name=HTTP loop=$site.http_equiv}
    <meta http-equiv="{$HTTP:key|wash}" content="{$HTTP:item|wash}" />
{/section}

{section name=meta loop=$site.meta}
    <meta name="{$meta:key|wash}" content="{$meta:item|wash}" />
{/section}

<meta name="MSSmartTagsPreventParsing" content="TRUE" />
<meta name="generator" content="eZ publish" />

{/default}
{* page header finished *}
</head>

<body>
<div id="container">
    {* Top box START *}
    <div id="topbox">
        <form action={"/content/search/"|ezurl} method="get">
	<div id="logo">
{*	    <a href="/"><img src={$pagedesign.data_map.image.content[original].full_path|ezroot} /></a> *}
	</div>
	<div id="searchbox">
	        <input type="text" size="20" name="SearchText" id="Search" value="" />
	        <input class="button" name="SearchButton" type="submit" value="{'Search'|i18n('design/standard/layout')}" />
	</div>
	<div id="sitelogo">
	    <img src={"06_intranet_logo.png"|ezimage} />
	</div>
	</form>
    </div>
    {* Top box END *}

    {* Top menu START *}
    <div id="topmenu">
	{* Menubox start *}
	{let  top_menu=fetch( content, list, hash( parent_node_id, 2, 
				     limit, 6, 
				     sort_by, array( priority, true() ),
				     class_filter_type, include,
				     class_filter_array, array( 'folder' ) ) ) }

	{section name=item loop=$top_menu}
	    <div class="item">
	        <a href={concat("/content/view/full/",$:item.node_id,"/")|ezurl}>{$:item.name|wash}</a>
	    </div>
            {delimiter}
	    <div class="delimiter">
            |
            </div> 
            {/delimiter}
	{/section}
	{/let}
	{* Menubox stop *}    
    </div>
    {* Top menu END *}

    {* Main path START *}
    <div id="mainpath">
	{section name=Path loop=$module_result.path}
            <div class="item">  
	    {section show=$Path:item.url}
	    <a href={$Path:item.url|ezurl}>{$Path:item.text|shorten(18)|wash}</a>
	    {section-else}
	    {$Path:item.text|wash}
	    {/section}
            </div>   
	    {delimiter}
            <div class="delimiter">  
	    /
            </div>   
	    {/delimiter}
	{/section}
    </div>
    {* Main path END *}

    {* Main part START *}
    <div id="mainframe">

    {* Main menu START *}
    <div id="mainmenu">
    {let MainMenu=treemenu($module_result.path,$module_result.node_id,1)}
        {section name=Menu loop=$MainMenu}
            <div class="item">
	    {section show=$:item.is_selected}
               <div class="selected">
            {/section}

            <div class="level_{$:item.level}">
               <a href={$:item.url_alias|ezurl}>{$Menu:item.text}</a>
            </div>

	    {section show=$:item.is_selected}
               </div>
            {/section}
            </div>
        {/section}
    {/let}
    
    </div>

    {* Main menu END *}

    {* Main area START *}

    <div id="maincontent">
    {$module_result.content}    
    </div>
    
    </div>
    
    {* Main area END *}

{* Main part END *}

{* Footer START *}
<div id="footer">
    <a href="http://ez.no">eZ publish&trade;</a> copyright &copy; 1999-2003 <a href="http://ez.no">eZ systems as</a>
</div>
{* Footer END *}

</div>
<!--DEBUG_REPORT-->

</body>

{/let}
</html>
