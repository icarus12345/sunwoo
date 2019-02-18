<table class="table table-bordered">
	<thead>
		<tr>
			<th>[{if $lang=='en'}]No[{else}]STT[{/if}]</th>
			<th width="120">[{if $lang=='en'}]Name[{else}]Họ Tên[{/if}]</th>
			<th>[{if $lang=='en'}]Subject[{else}]Tiêu đề[{/if}]</th>
			<th width="100">[{if $lang=='en'}]Date[{else}]Ngày[{/if}]</th>
		</tr>
	</thead>
	<tbody>
		[{assign "no" value=1}]
		[{foreach from=$advisory_list item=foo}]
		<tr>
			<th scope="row">[{$no++}]</th>
			<td>[{$foo->advisory_name|escape:'html'}]</td>
			<td><a href="/tu-van/[{$foo->advisory_id}]" >[{$foo->advisory_title|escape:'html'}]</a></td>
			<td>[{$foo->advisory_publicday|escape:'html'|date_format}]</td>
		</tr>
		[{foreachelse}]
		<tr>
			<td colspan="4">Đang cập nhật dữ liệu...</td>
		</tr>
		[{/foreach}]
	</tbody>
</table>
<div>
[{$htmlPager}]
</div>