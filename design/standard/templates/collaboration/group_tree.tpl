{default parent_group_id=0
         current_depth=0
         summary_indentation=10
         group_tree=fetch("collaboration","group_tree",hash("parent_group_id",$parent_group_id))}

<table class="list" cellspacing="0" cellpadding="0" border="0">
<tr>
  <th>{"Groups"|i18n('design/standard/collaboration')}</th>
</tr>
{section name=Group loop=$group_tree sequence=array(bglight,bgdark)}
<tr>
{let group_item_count=$:item.item_count}
  <td class="{$:sequence}">
    <p><nobr><img src={"1x1.gif"|ezimage} width="{mul(sub($:item.depth,$current_depth),$summary_indentation)}" height="1" alt="" border="0" />
    <a href={concat("collaboration/group/list/",$:item.id)|ezurl}>{$:item.title}</a>{section show=$:group_item_count|gt(0)} <b>({$:group_item_count})</b>{/section}</nobr></p>
  </td>
{/let}
</tr>
{/section}
</table>

{/default}
