<form action={concat( $module.functions.groupedit.uri, '/', $classgroup.id)|ezurl} method="post" name="GroupEdit">
<div class="context-block">
{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
<h2 class="context-title">{$classgroup.name|classgroup_icon( normal, $classgroup.name )}&nbsp;{'Edit <%group_name> [Class group]'|i18n( 'design/admin/class/groupedit',, hash( '%group_name', $classgroup.name ) )|wash}</h2>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">
<div class="block">
<label>{'Name'|i18n( 'design/admin/class/groupedit' )}</label>
{include uri="design:gui/lineedit.tpl" name=Name id_name=Group_name value=$classgroup.name}
</div>
</div>

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block">
<input class="button" type="submit" name="StoreButton" value={'OK'|i18n( 'design/admin/class/groupedit' )} />
<input class="button" type="submit" name="DiscardButton" value={'Cancel'|i18n( 'design/admin/class/groupedit' )} />
</div>
{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>

</div>
</form>

